# Maintainer: Eric Langlois <eric@langlois.xyz>
pkgname=duplicacy-web
pkgver=1.7.2
pkgrel=1
pkgdesc="Cross-platform cloud backup tool with a web GUI"
arch=('x86_64' 'i686' 'arm' 'aarch64' 'armv7h')
url="https://duplicacy.com/"
license=('custom')
depends=()
makedepends=()
source=("$pkgname@.service"
        "$pkgname.service"
        "LICENSE")
source_x86_64=("$pkgname::https://acrosync.com/$pkgname/${pkgname//-/_}_linux_x64_$pkgver")
source_arm=("$pkgname::https://acrosync.com/$pkgname/${pkgname//-/_}_linux_arm_$pkgver")
source_aarch64=("$pkgname::https://acrosync.com/$pkgname/${pkgname//-/_}_linux_arm64_$pkgver")
sha256sums=('f169ca1196a3d99661b5fdf9b61d18c3f7a1341f6d90c1411874a9ebfecce10a'
            '33325dd4c621676af89c4f6c27105fb16e0b9b00e962e6496f7d532f907646bf'
            'f6da608f2babc6db66aed83e0ba7e1ce130680b15d2dbe01019cb01c88abc7db')
sha256sums_x86_64=('88383f7fea8462539cab7757dfa167bf42e37cbc19531b9de97373bc20efd317')
sha256sums_arm=('e2e1bfd03fa158b532a582c60aa4c7953d132573db6254d051bb5744c64acf22')
sha256sums_aarch64=('8ff18950d2c2d8ba9774c1b0add992ebdcdf984ed36a446cd8b7a8623088ee37')

package() {
	install -m755 -D -t "$pkgdir/usr/bin" "$pkgname"
	install -m644 -D -t "$pkgdir/usr/lib/systemd/system" "$pkgname@.service"
	install -m644 -D -t "$pkgdir/usr/lib/systemd/user" "$pkgname.service"
	install -m644 -D -t "$pkgdir/usr/share/licenses/$pkgname" "LICENSE"
}

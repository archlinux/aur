# Maintainer: Eric Langlois <eric@langlois.xyz>
pkgname=duplicacy-web
pkgver=1.6.3
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
sha256sums_x86_64=('7e20fefb806578792002199246596d86246a013a11892c68c9b7365d3b080661')
sha256sums_arm=('28033dafc2b6dfa6c78ea028736f947b8c5dc138b4f9629d0e0616c26cfd05f7')
sha256sums_aarch64=('43d09b28a3b1a8ec06369ee86982c9a74a817f2e52cb8e7d18122fd808f93f95')

package() {
	install -m755 -D -t "$pkgdir/usr/bin" "$pkgname"
	install -m644 -D -t "$pkgdir/usr/lib/systemd/system" "$pkgname@.service"
	install -m644 -D -t "$pkgdir/usr/lib/systemd/user" "$pkgname.service"
	install -m644 -D -t "$pkgdir/usr/share/licenses/$pkgname" "LICENSE"
}

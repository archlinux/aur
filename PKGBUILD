# Maintainer: Eric Langlois <eric@langlois.xyz>
pkgname=duplicacy-web
pkgver=1.8.0
pkgrel=1
pkgdesc="Cross-platform cloud backup tool with a web GUI"
arch=('x86_64' 'arm' 'aarch64')
url="https://duplicacy.com/"
license=('custom')
depends=()
makedepends=()
source=("$pkgname@.service"
        "$pkgname.service"
        "LICENSE")
source_x86_64=("$pkgname-$pkgver::https://acrosync.com/$pkgname/${pkgname//-/_}_linux_x64_$pkgver")
source_arm=("$pkgname-$pkgver::https://acrosync.com/$pkgname/${pkgname//-/_}_linux_arm_$pkgver")
source_aarch64=("$pkgname-$pkgver::https://acrosync.com/$pkgname/${pkgname//-/_}_linux_arm64_$pkgver")
sha256sums=('f169ca1196a3d99661b5fdf9b61d18c3f7a1341f6d90c1411874a9ebfecce10a'
            '33325dd4c621676af89c4f6c27105fb16e0b9b00e962e6496f7d532f907646bf'
            'f6da608f2babc6db66aed83e0ba7e1ce130680b15d2dbe01019cb01c88abc7db')
sha256sums_x86_64=('f0b4d4c16781a6ccb137f161df9de86574e7a55660c582682c63062e26476c4a')
sha256sums_arm=('1a664b86757e2f0c676d8e89176b26126a29ace03cbe71dc6836f5aba0ec9b56')
sha256sums_aarch64=('8b09a2c9253ebc9d3bfae5d289af03dbe744bfe3f7fa5cf373748e3d0902634d')

package() {
	install -m755 -D "$pkgname-$pkgver" "$pkgdir/usr/bin/$pkgname"
	install -m644 -D -t "$pkgdir/usr/lib/systemd/system" "$pkgname@.service"
	install -m644 -D -t "$pkgdir/usr/lib/systemd/user" "$pkgname.service"
	install -m644 -D -t "$pkgdir/usr/share/licenses/$pkgname" "LICENSE"
}

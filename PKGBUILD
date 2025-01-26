# Maintainer: Eric Langlois <eric@langlois.xyz>
pkgname=duplicacy-web
pkgver=1.8.3
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
sha256sums_x86_64=('9cdcaa875ae5fc0fcf93941df3a5133fb3c3ff92c89f87babddc511ba6dd7ef8')
sha256sums_arm=('b1a529eb1f102d3529002eb763f78934df2268c767f610c92e451e7a50035b8d')
sha256sums_aarch64=('ff611509d8d1ea7f5382a1f2681b597a64a4d845056b164c935bfdd217320836')

package() {
	install -m755 -D "$pkgname-$pkgver" "$pkgdir/usr/bin/$pkgname"
	install -m644 -D -t "$pkgdir/usr/lib/systemd/system" "$pkgname@.service"
	install -m644 -D -t "$pkgdir/usr/lib/systemd/user" "$pkgname.service"
	install -m644 -D -t "$pkgdir/usr/share/licenses/$pkgname" "LICENSE"
}

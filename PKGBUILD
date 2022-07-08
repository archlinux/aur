# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=image-roll-bin
pkgver=2.1.0
pkgrel=1
pkgdesc="GTK image viewer with basic image manipulation tools"
arch=('x86_64')
url="https://github.com/weclaw1/image-roll"
license=('MIT')
depends=('gtk4')
provides=("image-roll")
conflicts=("image-roll")
source=("image-roll-$pkgver.deb::$url/releases/download/$pkgver/image-roll_${pkgver}_amd64.deb")
sha256sums=('de6b66f8651a518319967f79ff974dafa0765beb00e559557424b9048fc5a6c7')

prepare() {
	mkdir -p "$pkgname-$pkgver"
	bsdtar -xf data.tar.xz -C "$pkgname-$pkgver"
}

package() {
	cd "$pkgname-$pkgver"
	cp -a --no-preserve=ownership . "$pkgdir/"
	install -d "$pkgdir/usr/share/licenses/$pkgname/"
	ln -s "/usr/share/doc/image-roll/copyright" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

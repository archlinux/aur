# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=image-roll-bin
pkgver=1.5.0
pkgrel=1
pkgdesc="GTK image viewer with basic image manipulation tools"
arch=('x86_64')
url="https://github.com/weclaw1/image-roll"
license=('MIT')
depends=('gtk3')
provides=("image-roll")
conflicts=("image-roll")
source=("image-roll-$pkgver.deb::$url/releases/download/$pkgver/image-roll_${pkgver}_amd64.deb")
sha256sums=('1c64a464bee49a643c97dd4e0394c9b27c277e2e79d3885f4218b1162be2e128')

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

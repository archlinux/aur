# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=image-roll-bin
pkgver=1.4.0
pkgrel=1
pkgdesc="GTK image viewer with basic image manipulation tools"
arch=('x86_64')
url="https://github.com/weclaw1/image-roll"
license=('MIT')
depends=('gtk3')
provides=("image-roll")
conflicts=("image-roll")
source=("image-roll-$pkgver.deb::$url/releases/download/$pkgver/image-roll_${pkgver}_amd64.deb")
sha256sums=('29d9b04483136a74efc876878262764718e435bea28f09168f2fa775cc28f463')

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

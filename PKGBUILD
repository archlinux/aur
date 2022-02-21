# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=image-roll-bin
pkgver=1.6.0
pkgrel=1
pkgdesc="GTK image viewer with basic image manipulation tools"
arch=('x86_64')
url="https://github.com/weclaw1/image-roll"
license=('MIT')
depends=('gtk3')
provides=("image-roll")
conflicts=("image-roll")
source=("image-roll-$pkgver.deb::$url/releases/download/$pkgver/image-roll_${pkgver}_amd64.deb")
sha256sums=('ac61c2cfe125e06d3c2f32df9c1476065615ae5e2b3b73952e35c010733eb92e')

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

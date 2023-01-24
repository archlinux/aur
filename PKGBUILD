# Maintainer: endaaman <endaaman@frontier.hokudai.ac.jp>

pkgname=tym
pkgver=3.4.0
pkgrel=1
pkgdesc="Lua-configurable terminal emulator"
arch=('x86_64')
url="https://github.com/endaaman/tym"
license=('MIT')
depends=('vte3' 'lua')
source=("https://github.com/endaaman/${pkgname}/releases/download/$pkgver/${pkgname}-$pkgver.tar.gz")
sha256sums=('83cdf9bb1dcea4f70c27acc641caa422bbf3988e885f8a5e66e1bf68e559ec45')
build() {
	cd "$pkgname-$pkgver"
	./configure --prefix=/usr
	make
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}

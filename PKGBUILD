# Maintainer: Kat Witten <turtlewit@live.com>
pkgname=cglm
pkgver=0.5.4
pkgrel=1
pkgdesc="OpenGL Mathematics (glm) for C"
arch=('x86_64')
url="https://github.com/recp/cglm"
license=('MIT')
depends=('glibc')
makedepends=('cmocka')
source=("$pkgname-$pkgver.tar.gz::https://github.com/recp/cglm/archive/v$pkgver.tar.gz")
md5sums=('ce6287faff1cfcef661372c51122ea68')

build() {
	cd "$pkgname-$pkgver"
	sh autogen.sh
	./configure --prefix=/usr
	make
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
	install -d "$pkgdir/usr/share/licenses/cglm"
	install LICENSE "$pkgdir/usr/share/licenses/cglm/"
}

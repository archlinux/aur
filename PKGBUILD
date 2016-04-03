# Maintainer: sekret, mail=$(echo c2VrcmV0QHBvc3Rlby5zZQo= | base64 -d)
pkgname=drumgizmo
pkgver=0.9.10
pkgrel=1
pkgdesc="an open source cross-platform drum plugin and stand-alone application (lv2)"
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
url="http://www.drumgizmo.org"
license=('GPL')
groups=('lv2-plugins')
depends=('libx11' 'libsmf' 'jack' 'expat')
makedepends=('lv2')
source=("http://www.drumgizmo.org/releases/$pkgname-$pkgver/$pkgname-$pkgver.tar.gz")
md5sums=('5a563751b428248a2b11f63ab6f1d20c')

build() {
	cd "$pkgname-$pkgver"
	./configure --prefix=/usr \
              --enable-lv2
	make
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:

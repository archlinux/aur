pkgname=iris-flower
pkgver=1.0
pkgrel=1
pkgdesc="Eye protection utility. Change brightness, color temperature and color scheme on X11"
arch=('i686' 'x86_64')
url="https://github.com/ueberchild/iris-flower"
license=('GPL3')
makedepends=('libx11' 'libxrandr')
source=("git+https://github.com/ueberchild/iris-flower.git")
md5sums=('SKIP')

build() {
	cd "${srcdir}/$pkgname/"
	cc -Wall -std=c99 -o iris-flower iris-flower.c -lX11 -lXrandr
}

package() {
	cd "${srcdir}/$pkgname/"
	install -D iris-flower "$pkgdir/usr/bin/iris-flower"
}


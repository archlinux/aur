pkgname=iris-flower
pkgver=1.0
pkgrel=1
pkgdesc="Eye protection utility. Change brightness, color temperature and color scheme on X11"
arch=('i686' 'x86_64')
url="https://github.com/ueberchild/iris-flower"
license=('GPL3')
makedepends=('libx11' 'libxrandr')
source=("https://github.com/ueberchild/iris-flower/blob/master/iris-flower.c")
md5sums=('42ca45d3af1d540c77b61c11411df95a')

build() {
	cd "$srcdir/"
	cc -Wall -std=c99 -o iris-flower iris-flower.c -lX11 -lXrandr
}

package() {
  cd "$srcdir/"
  install -D iris-flower "$pkgdir/usr/bin/iris-flower"
}

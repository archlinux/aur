# Maintainer: Marco Kundt <mrckndt@gmail.com>

pkgname=libgtk3-nocsd-git
pkgver=r55.82ff5a0
pkgrel=1
pkgdesc='A hack to disable gtk+ 3 client side decoration (library)'
arch=('i686' 'x86_64')
url='https://github.com/PCMan/gtk3-nocsd'
license=('GPL')
depends=('gtk3')
makedepends=('git' 'pkgconfig' 'gobject-introspection' 'gtk3')
conflicts=('gtk3-nocsd')
source=(git+https://github.com/PCMan/gtk3-nocsd)

sha256sums=('SKIP')

_gitname='gtk3-nocsd'

pkgver() {
  cd "$srcdir/$_gitname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/$_gitname"
  make
}

package() {
  cd "$srcdir/$_gitname"
  install -D -m 0644 libgtk3-nocsd.so.0 "${pkgdir}"/usr/lib/libgtk3-nocsd.so.0
}

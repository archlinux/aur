# Maintainer: Andy Alt <andy400-dev at yahoo dot com>
# Contributor: Lukas Jirkovsky <l.jirkovsky@gmail.com>

pkgname=gimp-plugin-dcamnoise2
pkgver=0.64
pkgrel=7
pkgdesc="Removes noise from images"
arch=('i686' 'x86_64')
url="https://bitbucket.org/stativ/gimp-plugin-dcamnoise2/src/master/"
license=('GPL')
depends=('gimp')
source=("https://bitbucket.org/stativ/gimp-plugin-dcamnoise2/raw/a1de7f38cdce2fd65169f40db47704cb1885a831/dcamnoise2-${pkgver}.cpp")
md5sums=('ace7859517a7d161abe47b6f0eb4281a')

build() {
  cd "$srcdir"
  export LIBS="-lstdc++ -lm"
  gimptool-2.0 --build dcamnoise2-$pkgver.cpp
}

package() {
  cd "$srcdir"
  install -D -m755 dcamnoise2-$pkgver \
    "$pkgdir"/usr/lib/gimp/2.0/plug-ins/dcamnoise2
}

# Maintainer: Lukas Jirkovsky <l.jirkovsky@gmail.com>
pkgname=gimp-plugin-dcamnoise2
pkgver=0.64
pkgrel=6
pkgdesc="Removes noise from images"
arch=('i686' 'x86_64')
url="http://example.org/"
#url="http://hphsite.de/dcamnoise/"
license=('GPL')
depends=('gimp')
source=("https://bitbucket.org/stativ/gimp-plugin-dcamnoise2/raw/tip/dcamnoise2-${pkgver}.cpp")
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

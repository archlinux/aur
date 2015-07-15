# Contributor: Adrià Arrufat <swiftscythe@gmail.com>

pkgname=lated
pkgver=0.1
pkgrel=1
pkgdesc="A simple LaTeX editor with preview function."
arch=('i686' 'x86_64')
url="http://opendesktop.org/content/show.php/laTed?content=121895"
depends=('kdegraphics-okular')
makedepends=('cmake' 'automoc4')
source=(http://opendesktop.org/CONTENT/content-files/121895-lated.tar.bz)
license=('GPL')
md5sums=('67d6470b3e0379ce9ca68ad7ce46faf3')

build() {
  cd $srcdir/lated
  mkdir build
  cd build
  cmake -DCMAKE_INSTALL_PREFIX='/usr' ..
  make || return 1
  make DESTDIR=$pkgdir install
}

# Maintainer: Azael Reyes <azael.devel@gmail.com>


pkgname=octetos-core
pkgver=2.0.0
pkgrel=1
pkgdesc="C/C++ library to mainly provide Semantic Versioned inplmetation"
arch=('x86_64')
license=('GPL')
url="https://github.com/azaeldevel/octetos-core.git"
depends=('bison' 'libconfig' 'intltool')
#backup=('etc/nanorc')
md5sums=('0379f9c6afe8ad5794ca9ea3b9438bda')
source=(https://github.com/azaeldevel/octetos-core/archive/2.0.0-alpha.2.tar.gz)

build() {
    cd octetos-core-2.0.0-alpha.2   
    autoreconf -fi
    ./configure --prefix=/usr --sysconfdir=/etc
    make
}

package() {
  cd octetos-core-2.0.0-alpha.2
  make DESTDIR="${pkgdir}" install
}

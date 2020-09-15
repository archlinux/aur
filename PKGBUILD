# Maintainer: Azael Reyes <azael.devel@gmail.com>


pkgname=octetos-core
pkgver=2.5.0
pkgrel=1
pkgdesc="C/C++ library to mainly provide Semantic Versioned inplmetation"
arch=('x86_64')
license=('GPL')
url="https://github.com/azaeldevel/octetos-core.git"
depends=('gcc' 'bison' 'libconfig' 'perl-xml-parser' 'intltool')
#backup=('etc/nanorc')
md5sums=('c85028bac2a68bc415a0210a33fa3d3e')
source=(https://github.com/azaeldevel/octetos-core/archive/2.5.0-alpha.tar.gz)

build() {
    cd octetos-core-2.5.0-alpha
    autoreconf -fi
    ./configure --prefix=/usr --sysconfdir=/etc
    make
}

package() {
  cd octetos-core-2.5.0-alpha
  make DESTDIR="${pkgdir}" install
}

# Maintainer: Azael Reyes <azael.devel@gmail.com>


pkgname=octetos-core
pkgver=2.7.3
pkgrel=1
pkgdesc="C/C++ library to mainly provide Semantic Versioned inplmetation"
arch=('x86_64')
license=('GPL')
url="https://github.com/azaeldevel/octetos-core.git"
depends=('gcc' 'bison' 'libconfig' 'perl-xml-parser' 'intltool')
#backup=('etc/nanorc')
md5sums=('f36caaccfe81ce0d275a73ab804dca01')
source=(https://github.com/azaeldevel/octetos-core/archive/2.7.3-alpha.tar.gz)

build() {
    cd octetos-core-2.7.3-alpha
    autoreconf -fi
    ./configure --prefix=/usr --sysconfdir=/etc
    make
}

package() {
  cd octetos-core-2.7.3-alpha
  make DESTDIR="${pkgdir}" install
}

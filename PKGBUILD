# Maintainer: Azael Reyes <azael.devel@gmail.com>


pkgname=octetos-core
pkgver=2.57.1
pkgrel=1
phase=alpha
pkgdesc="C/C++ library to mainly provide Semantic Versioned inplmetation"
arch=('x86_64')
license=('GPL')
url="https://github.com/azaeldevel/octetos-core.git"
depends=('gcc' 'bison' 'libconfig' 'perl-xml-parser' 'intltool' 'cunit')
#backup=('etc/nanorc')
md5sums=('585da95e1bd1b9f8e25058313bb528d0')
source=(https://github.com/azaeldevel/$pkgname/archive/$pkgver-$phase.tar.gz)

build() {
    cd $pkgname-$pkgver-$phase
    autoreconf -fi
    ./configure --prefix=/usr --sysconfdir=/etc --enable-static --enable-shared
    make
}

package() {
  cd $pkgname-$pkgver-$phase
  make DESTDIR="${pkgdir}" install
}

# Maintainer: Azael Reyes <azael.devel@gmail.com>


pkgname=octetos-core
pkgver=2.57.0
pkgrel=2
phase=alpha
pkgdesc="C/C++ library to mainly provide Semantic Versioned inplmetation"
arch=('x86_64')
license=('GPL')
url="https://github.com/azaeldevel/octetos-core.git"
depends=('gcc' 'bison' 'libconfig' 'perl-xml-parser' 'intltool' 'cunit')
#backup=('etc/nanorc')
md5sums=('6a23d7c5ac635c3ce42cbcf8ccc1b420')
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

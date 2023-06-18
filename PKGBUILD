# Maintainer: Azael Reyes <azael.devel@gmail.com>


pkgname=octetos-core
pkgver=2.62.1
pkgrel=1
phase=beta
pkgdesc="C/C++ library to mainly provide Semantic Versioned inplmetation"
arch=('x86_64')
license=('GPL')
url="https://github.com/azaeldevel/octetos-core.git"
depends=('gcc' 'bison' 'libconfig' 'perl-xml-parser' 'intltool' 'cunit')
#backup=('etc/nanorc')
md5sums=('b93db641889793b35544f5a3bae2858d')
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

# Maintainer: Azael Reyes <azael.devel@gmail.com>


pkgname=octetos-core
pkgver=2.8.0
pkgrel=1
pkgdesc="C/C++ library to mainly provide Semantic Versioned inplmetation"
arch=('x86_64')
license=('GPL')
url="https://github.com/azaeldevel/octetos-core.git"
depends=('gcc' 'bison' 'libconfig' 'perl-xml-parser' 'intltool')
#backup=('etc/nanorc')
md5sums=('0d5713f449dd8776a73044992e1fbb11')
source=(https://github.com/azaeldevel/$pkgname/archive/$pkgver-alpha.tar.gz)

build() {
    cd $pkgname-$pkgver-alpha
    autoreconf -fi
    ./configure --prefix=/usr --sysconfdir=/etc
    make
}

package() {
  cd $pkgname-$pkgver-alpha
  make DESTDIR="${pkgdir}" install
}

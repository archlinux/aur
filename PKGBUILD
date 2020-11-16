# Maintainer: Azael Reyes <azael.devel@gmail.com>


pkgname=octetos-core
pkgver=2.8.4
pkgrel=1
pkgdesc="C/C++ library to mainly provide Semantic Versioned inplmetation"
arch=('x86_64')
license=('GPL')
url="https://github.com/azaeldevel/octetos-core.git"
depends=('gcc' 'bison' 'libconfig' 'perl-xml-parser' 'intltool')
#backup=('etc/nanorc')
md5sums=('19e0b33707fc2d5a537d88e2be6cadb0')
source=(https://github.com/azaeldevel/$pkgname/archive/$pkgver-beta.tar.gz)

build() {
    cd $pkgname-$pkgver-beta
    autoreconf -fi
    ./configure --prefix=/usr --sysconfdir=/etc
    make
}

package() {
  cd $pkgname-$pkgver-beta
  make DESTDIR="${pkgdir}" install
}

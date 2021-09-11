# Maintainer: Azael Reyes <azael.devel@gmail.com>


pkgname=octetos-core
pkgver=2.31.5
pkgrel=1
pkgdesc="C/C++ library to mainly provide Semantic Versioned inplmetation"
arch=('x86_64')
license=('GPL')
url="https://github.com/azaeldevel/octetos-core.git"
depends=('gcc' 'bison' 'libconfig' 'perl-xml-parser' 'intltool' 'cunit')
#backup=('etc/nanorc')
md5sums=('35a4fa760012bde37e897f5516397e3f')
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

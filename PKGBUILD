# Maintainer: Azael Reyes <azael.devel@gmail.com>


pkgname=octetos-core
pkgver=2.25.1
pkgrel=1
pkgdesc="C/C++ library to mainly provide Semantic Versioned inplmetation"
arch=('x86_64')
license=('GPL')
url="https://github.com/azaeldevel/octetos-core.git"
depends=('gcc' 'bison' 'libconfig' 'perl-xml-parser' 'intltool' 'cunit')
#backup=('etc/nanorc')
md5sums=('9f1bf6ccfb1457fdde7ec1fbda5b222f')
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

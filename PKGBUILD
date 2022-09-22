# Maintainer: Azael Reyes <azael.devel@gmail.com>


pkgname=octetos-core
pkgver=2.56.4
pkgrel=1
phase=alpha
pkgdesc="C/C++ library to mainly provide Semantic Versioned inplmetation"
arch=('x86_64')
license=('GPL')
url="https://github.com/azaeldevel/octetos-core.git"
depends=('gcc' 'bison' 'libconfig' 'perl-xml-parser' 'intltool' 'cunit')
#backup=('etc/nanorc')
md5sums=('4a3f22029b293fbec9f951aea19c1c51')
source=(https://github.com/azaeldevel/$pkgname/archive/$pkgver-$phase.tar.gz)

build() {
    cd $pkgname-$pkgver-$phase
    autoreconf -fi
    ./configure --prefix=/usr --sysconfdir=/etc
    make
}

package() {
  cd $pkgname-$pkgver-$phase
  make DESTDIR="${pkgdir}" install
}

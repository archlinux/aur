# Maintainer: Azael Reyes <azael.devel@gmail.com>


pkgname=octetos-core
pkgver=1.2.2
pkgrel=1
pkgdesc="C/C++ library to mainly provide Semantic Versioned inplmetation"
arch=('x86_64')
license=('GPL')
url="https://github.com/azaeldevel/octetos-core.git"
depends=('bison' 'libconfig')
#backup=('etc/nanorc')
md5sums=('640cc5a4afd0cd4d98b765c0eb03981a')
source=(https://github.com/azaeldevel/octetos-core/archive/1.2.2-br.tar.gz)

build() {
    cd octetos-core-1.2.2-br   
    ./autogen.sh
    ./configure --prefix=/usr --sysconfdir=/etc
    make
}

package() {
  cd octetos-core-1.2.2-br
  make DESTDIR="${pkgdir}" install
}

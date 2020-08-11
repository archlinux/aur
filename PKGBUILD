# Maintainer: Azael Reyes <azael.devel@gmail.com>


pkgname=octetos-core
pkgver=2.3.1
pkgrel=1
pkgdesc="C/C++ library to mainly provide Semantic Versioned inplmetation"
arch=('x86_64')
license=('GPL')
url="https://github.com/azaeldevel/octetos-core.git"
depends=('bison' 'libconfig' 'intltool')
#backup=('etc/nanorc')
md5sums=('5eccd80fdadde558d9d93be996154901')
source=(https://github.com/azaeldevel/octetos-core/archive/2.3.1-beta.1.tar.gz)

build() {
    cd octetos-core-2.3.1-beta.1
    autoreconf -fi
    ./configure --prefix=/usr --sysconfdir=/etc
    make
}

package() {
  cd octetos-core-2.3.1-beta.1
  make DESTDIR="${pkgdir}" install
}

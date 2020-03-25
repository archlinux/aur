# Maintainer: Azael Reyes <azael.devel@gmail.com>


pkgname=octetos-core
pkgver=1.2.0
pkgrel=1
pkgdesc="C/C++ library to mainly provider implmetation Semver."
arch=('x86_64')
license=('GPL')
url="https://github.com/azaeldevel/octetos-core.git"
depends=('bison' 'libconfig')
#backup=('etc/nanorc')
md5sums=('a1adc9f001db1ae6fcda8e8a723e3b92')
source=(https://github.com/azaeldevel/octetos-core/archive/1.2.0-br.tar.gz)

build() {
    cd octetos-core-1.2.0-br   
    ./autogen.sh
    ./configure --prefix=/usr --sysconfdir=/etc
    make
}

package() {
  cd octetos-core-1.2.0-br
  make DESTDIR="${pkgdir}" install
}

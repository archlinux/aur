# Contributor: Pierre Schmitz <pierre@archlinux.de>

pkgname=kio_gopher
_pkgname=kio-gopher
pkgver=0.1.4
pkgrel=1
pkgdesc="Gets you gopher protocol support in KIO."
arch=('i686' 'x86_64')
url="http://userbase.kde.org/Kio_gopher"
license=('GPL')
depends=('kdelibs')
makedepends=('cmake' 'automoc4')
options=('docs')
source=("http://download.kde.org/stable/extragear/${_pkgname}-${pkgver}.tar.bz2")

build() {
  cd $srcdir
  if [ -d build ] ; then
      rm build -rf
  fi
  mkdir build
  cd build
  cmake ../${_pkgname}-${pkgver} \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr
  make
  make DESTDIR=$pkgdir install
}
md5sums=('401e7a22f35f9528512f36f6e2060d21')

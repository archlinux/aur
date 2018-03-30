# Maintainer:  Martin C. Doege <mdoege at compuserve dot com>
# Contributor: Pierre Schmitz <pierre@archlinux.de>

pkgname=kio_gopher
_pkgname=kio-gopher
pkgver=0.1.99
pkgrel=1
pkgdesc="Gets you gopher protocol support in KIO"
arch=('i686' 'x86_64')
url="http://userbase.kde.org/Kio_gopher"
license=('GPL')
depends=('plasma-framework')
makedepends=('cmake' 'extra-cmake-modules')
options=('docs')
source=("http://download.kde.org/unstable/kio-gopher/${_pkgname}-${pkgver}.tar.xz")
md5sums=('fb0afc1e3430158962c4d843bae385f5')

package() {
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


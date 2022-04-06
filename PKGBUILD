# Maintainer: Michael Schubert <mschu.dev at gmail>
pkgname=libnuml
_pkgname=NuML
pkgver=1.1.5
pkgrel=1
pkgdesc="Numerical Markup Language (NuML) for exchange and archiving of numerical results"
url="https://github.com/NuML/NuML"
license=('LGPL')
arch=('i686' 'x86_64')
depends=('libsbml')
source=($_pkgname-$pkgver.tar.gz::https://github.com/NuML/NuML/archive/v$pkgver.tar.gz)
sha256sums=('ae67c85d9323f855856a17685ed3e542e90350f25df1c7d727009ee998fe63e2')

build() {
  cd "$srcdir/$_pkgname-$pkgver"
  cmake \
    -DCMAKE_INSTALL_PREFIX:PATH=/usr \
    $pkgname
  make
}

package() {
  cd "$srcdir"/$_pkgname-$pkgver
  DESTDIR="$pkgdir" cmake -P cmake_install.cmake
}

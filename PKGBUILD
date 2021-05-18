# Maintainer: Michael Schubert <mschu.dev at gmail>
pkgname=libnuml
_pkgname=NuML
pkgver=1.1.4
pkgrel=1
pkgdesc="Numerical Markup Language (NuML) for exchange and archiving of numerical results"
url="https://github.com/NuML/NuML"
license=('LGPL')
arch=('i686' 'x86_64')
depends=('libsbml')
source=($_pkgname-$pkgver.tar.gz::https://github.com/NuML/NuML/archive/v$pkgver.tar.gz)
sha256sums=('18e8f6d9b0c261f34123bc2e1bd601730993d63fb53f7434b5901b1059aa9109')

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

# Maintainer: Michael Schubert <mschu.dev at gmail>
pkgname=libnuml
_pkgname=NuML
pkgver=1.1.1
pkgrel=1
pkgdesc="Numerical Markup Language (NuML) for exchange and archiving of numerical results"
url="https://github.com/NuML/NuML"
license=('LGPL')
arch=('i686' 'x86_64')
depends=('libsbml')
source=("https://github.com/NuML/NuML/archive/v$pkgver.tar.gz")
md5sums=('dfdc6d008afd032d395e40788e9553dc')

build() {
  cd "$srcdir/$_pkgname-$pkgver"
  cmake $pkgname
  make
}

package() {
  cd "$srcdir"/build
  DESTDIR="$pkgdir" cmake -DCMAKE_INSTALL_PREFIX=/usr -P cmake_install.cmake
}

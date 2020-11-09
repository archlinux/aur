# Maintainer: Adam Goldsmith <contact@adamgoldsmith.name>

pkgname=python-pynest2d-git
_pkgname=pynest2d
pkgver=cura.4.8.beta.r1.gd31a381
pkgrel=1
pkgdesc="Python bindings for libnest2d"
arch=('any')
url="https://github.com/Ultimaker/pynest2d"
license=('LGPL3')
makedepends=(sip)
depends=(libnest2d)
provides=(python-pynest2d)
conflicts=(python-pynest2d)
source=("git+https://github.com/Ultimaker/pynest2d")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/$_pkgname"

  mkdir build
  cd build
  cmake .. -DCMAKE_INSTALL_PREFIX=/usr
}

package() {
  cd "$srcdir/$_pkgname/build"

  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:

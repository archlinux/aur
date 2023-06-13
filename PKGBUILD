# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: Janusz Lewandowski <lew21@xtreeme.org>

pkgname=python-pydbus-git
pkgver=0.6.0.r17.77fc029
pkgrel=1
pkgdesc="Pythonic DBus library"
arch=(any)
url="https://github.com/openEuler-BaseService/pydbus"
license=(LGPL2.1)
depends=(python python-gobject gobject-introspection-runtime)
makedepends=(git python-setuptools)
provides=(python-pydbus)
conflicts=(python-pydbus)
source=("git+https://github.com/openEuler-BaseService/pydbus.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/pydbus"
  git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g;s/v//'
}

package_python-pydbus-git() {
  cd "$srcdir/pydbus"
  python setup.py install --root="$pkgdir/" --optimize=1
}

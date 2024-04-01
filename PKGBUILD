# Maintainer: Trougnouf (Benoit Brummer) <trougnouf@gmail.com>

_name=pyephem
pkgname=("python-${_name}-git")
pkgver=4.1.5.r2.g1499fa9
pkgrel=1
pkgdesc="Ephem python package for performing high-precision astronomy computations"
arch=('i686' 'x86_64')
url="https://rhodesmill.org/pyephem/"
license=('MIT')
depends=('python')
makedepends=('python-setuptools' 'git' 'python-docutils' 'python-sphinx')
provides=("python-${_name}")
conflicts=("python-${_name}")
source=("git+https://github.com/brandon-rhodes/${_name}.git")
md5sums=('SKIP')


pkgver() {
  cd "$_name"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${_name}"
  python setup.py build
}

package() {
  cd "${_name}"
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}


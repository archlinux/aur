# Maintainer: Davide Depau <davide@depau.eu>

_module='giofile'
_pkgname="python-${_module}"
pkgname="${_pkgname}-git"
pkgver=v0.2.0.r1.g59117aa
pkgrel=1
pkgdesc="Opens a Gio.File as a Python file object"
url="https://github.com/lazka/giofile"
depends=('python')
makedepends=('python-setuptools')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
license=('MIT')
arch=('any')
source=("${_module}::git+https://github.com/lazka/giofile.git")
sha512sums=('SKIP')

pkgver() {
  cd "$srcdir/$_module"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/$_module"
    python setup.py build
}

package() {
  cd "$srcdir/$_module"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
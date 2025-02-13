# Contributor: Sapphira Armageddos <shadowkyogre.public@gmail.com>

_upstream=pyment
pkgname=python-pyment-git
pkgver=0.3.4.r24.g684a742
pkgrel=1
pkgdesc="Create, update or convert docstrings in existing Python files, managing several styles."
arch=(any)
url="https://github.com/dadadel/${_upstream}"
license=(GPL)
depends=(python)
provides=('python-pyment')
conflicts=('python-pyment')
makedepends=(python-setuptools git)
source=("git+https://github.com/dadadel/${_upstream}/")

pkgver() {
  cd "${srcdir}/${_upstream}"
  git describe --long --tags|sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

package () {
    cd "${srcdir}/${_upstream}"
    python setup.py install --root="${pkgdir}/" --optimize=1

}

sha256sums=('SKIP')

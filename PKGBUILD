# Maintainer: acxz <akashpatel2008 at yahoo dot com>

pkgname=python-qtm
pkgver=2.0.5
pkgrel=1
pkgdesc='Python implementation of the real-time protocol for Qualisys Track
Manager'
arch=('any')
url='https://qualisys.github.io/qualisys_python_sdk/index.html'
license=('MIT')
depends=(python)
makedepends=(python python-setuptools)
_commit=1033ff405294881f3925c86bea9151b7953a8035 # Corresponds to 2.0.5 release
source=("$pkgname-$pkgver.tar.gz::https://github.com/qualisys/qualisys_python_sdk/archive/${_commit}.tar.gz")
sha256sums=('a974149801dd2bfc751990c2abdb476c4e66c505486402075ee6ea32b2a13997')

_pkgname=qualisys_python_sdk
_pkgver=${_commit}

build() {
  cd "${srcdir}/${_pkgname}-${_pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/${_pkgname}-${_pkgver}"
  python setup.py install --root="$pkgdir"/ --optimize=1
}

# Maintainer: acxz <akashpatel2008 at yahoo dot com>

pkgname=python-qtm
pkgver=2.0.6
pkgrel=1
pkgdesc='Python implementation of the real-time protocol for Qualisys Track
Manager'
arch=('any')
url='https://qualisys.github.io/qualisys_python_sdk/index.html'
license=('MIT')
depends=(python)
makedepends=(python python-setuptools)
source=("$pkgname-$pkgver.tar.gz::https://pypi.org/packages/source/q/qtm/qtm-${pkgver}.tar.gz")
sha256sums=('93cf19bc120edbdd60479c3d346a99994aa17db6f618d323239de941ab0c44c3')

_pkgname=qtm

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py install --root="$pkgdir"/ --optimize=1
}

# Maintainer: Simon Perry <aur [at] sanxion [dot] net>

pkgname=python-esipy
pkgver=1.0.0
pkgrel=1
_distname=EsiPy-${pkgver}
pkgdesc="Python client for the EVE Online ESI API"
arch=('any')
license=('BSD')
url="https://github.com/Kyria/EsiPy"
depends=('python-future' 'python-diskcache' 'python-jose' 'python-pyswagger' 'python-requests' 'python-six' 'python-redis' 'python-pylint' 'python-pytz')
makedepends=('python-setuptools')
source=("$url/archive/${pkgver}.tar.gz")
sha256sums=('8ed2f456d67658f47c473b7533b0fee40b989e4b71a21dba78b42a29efdd45ca')

build() {
  cd "${srcdir}"/"${_distname}"
  python setup.py build
}

package() {
  cd "${srcdir}"/"${_distname}"
  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/"${pkgname}"/LICENSE
}


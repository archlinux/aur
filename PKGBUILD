# Maintainer: Tomas S. <me+aur at wereii.cz>
# Contributor: Simon Perry <aur [at] sanxion [dot] net>

pkgname=python-esipy
pkgver=1.2.3
pkgrel=1
_distname=EsiPy-${pkgver}
pkgdesc="Python client for the EVE Online ESI API"
arch=('any')
license=('BSD')
url="https://github.com/Kyria/EsiPy"
depends=('python-future' 'python-diskcache' 'python-jose' 'python-pyswagger' 'python-requests' 'python-six' 'python-redis' 'python-pylint' 'python-pytz')
makedepends=('python-setuptools')
source=("$url/archive/${pkgver}.tar.gz")
sha256sums=('9dbcb91d42013e9a7aa3730fa58e61649d93a04d1315d3f8e3537d6606bc9969')

build() {
  cd "${srcdir}"/"${_distname}"
  python setup.py build
}

package() {
  cd "${srcdir}"/"${_distname}"
  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/"${pkgname}"/LICENSE
}


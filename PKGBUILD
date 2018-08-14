# Maintainer: Simon Perry <aur [at] sanxion [dot] net>

pkgname=python-esipy
pkgver=0.5.0
pkgrel=1
_distname=EsiPy-${pkgver}
pkgdesc="Python client for the EVE Online ESI API"
arch=('any')
license=('BSD')
url="https://github.com/Kyria/EsiPy"
depends=('python-future' 'python-diskcache' 'python-pyswagger' 'python-requests' 'python-six' 'python-redis' 'python-pylint' 'python-pytz')
makedepends=('python-setuptools')
source=("$url/archive/${pkgver}.tar.gz")
sha256sums=('711b6cdf1acf633d17c80682ecc5322bf04acd50c5f1fc97692a45ac732b31ad')

build() {
  cd "${srcdir}"/"${_distname}"
  python setup.py build
}

package() {
  cd "${srcdir}"/"${_distname}"
  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/"${pkgname}"/LICENSE
}


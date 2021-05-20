# Maintainer: Simon Perry <aur [at] sanxion [dot] net>

pkgname=python-esipy
pkgver=1.2.0
pkgrel=1
_distname=EsiPy-${pkgver}
pkgdesc="Python client for the EVE Online ESI API"
arch=('any')
license=('BSD')
url="https://github.com/Kyria/EsiPy"
depends=('python-future' 'python-diskcache' 'python-jose' 'python-pyswagger' 'python-requests' 'python-six' 'python-redis' 'python-pylint' 'python-pytz')
makedepends=('python-setuptools')
source=("$url/archive/${pkgver}.tar.gz")
sha256sums=('d2eacc5231795a74322bd50404d1db82edf1746a8e092bce7c337c6e44eb7ab5')

build() {
  cd "${srcdir}"/"${_distname}"
  python setup.py build
}

package() {
  cd "${srcdir}"/"${_distname}"
  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/"${pkgname}"/LICENSE
}


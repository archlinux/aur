pkgname=python-abi3audit
pkgver=0.0.26
pkgrel=1
pkgdesc="Scans Python wheels for abi3 violations and inconsistencies"
url="https://pypi.org/project/abi3audit/"
arch=('any')
license=('MIT')
makedepends=('python-setuptools')
depends=('python-abi3info' 'python-kaitaistruct' 'python-packaging' 'python-pefile' 'python-pyelftools' 'python-requests' 'python-requests-cache' 'python-rich')
source=("https://github.com/pypa/abi3audit/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('05da8fb72a5006c24917e1e6b89dc294ce49a2c38ae6c4096aa6d87e72ae4ac3')

build () {
  cd "${srcdir}"/abi3audit-${pkgver}
  python -m build --wheel --no-isolation
}

package() {
  cd "${srcdir}"/abi3audit-${pkgver}
  python -m installer --destdir="${pkgdir}" dist/*.whl
}

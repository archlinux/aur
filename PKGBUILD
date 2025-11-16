pkgname=python-abi3audit
pkgver=0.0.23
pkgrel=1
pkgdesc="Scans Python wheels for abi3 violations and inconsistencies"
url="https://pypi.org/project/abi3audit/"
arch=('any')
license=('MIT')
makedepends=('python-setuptools')
depends=('python-abi3info' 'python-kaitaistruct' 'python-packaging' 'python-pefile' 'python-pyelftools' 'python-requests' 'python-requests-cache' 'python-rich')
source=("https://github.com/pypa/abi3audit/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('50912fd9a1862fcc4b42a5e15ab41449832510b9cb51e8ec38099773ba4f6768')

build () {
  cd "${srcdir}"/abi3audit-${pkgver}
  python -m build --wheel --no-isolation
}

package() {
  cd "${srcdir}"/abi3audit-${pkgver}
  python -m installer --destdir="${pkgdir}" dist/*.whl
}

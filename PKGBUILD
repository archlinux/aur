# Maintainer: Khorne <khorne@khorne.me>
pkgname=python-lib4sbom
_name=${pkgname##python-}
pkgver=0.7.1
pkgrel=1
pkgdesc="Library to ingest and generate SBOMs "
arch=('any')
url="https://github.com/anthonyharrison/lib4sbom"
license=('Apache-2.0')
depends=('python' 'python-yaml' 'python-semantic-version' 'python-defusedxml' 'python-pytest')
makedepends=('python-setuptools' 'python-pytest')
source=("${_name}-${pkgver}.tar.gz::https://github.com/anthonyharrison/${_name}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('4854acab75801b59dbe53b693f872e2ae82ba60df8089508352757e25302bdca')

build() {
    cd "${_name}-${pkgver}"
    python setup.py build
}

package() {
    cd "${_name}-${pkgver}"
    python setup.py install --root="$pkgdir" --optimize=1
}

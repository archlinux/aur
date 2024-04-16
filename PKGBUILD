# Maintainer: Khorne <khorne@khorne.me>
pkgname=python-lib4sbom
_name=${pkgname##python-}
pkgver=0.7.0
pkgrel=2
pkgdesc="Library to ingest and generate SBOMs "
arch=('any')
url="https://github.com/anthonyharrison/lib4sbom"
license=('Apache-2.0')
depends=('python' 'python-yaml' 'python-semantic-version' 'python-defusedxml' 'python-pytest')
makedepends=('python-setuptools' 'python-pytest')
source=("${_name}-${pkgver}.tar.gz::https://github.com/anthonyharrison/${_name}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('23c19831bcdc743470fa0623accbfffd9983b625e99c0602c0de359877a654a5')

build() {
    cd "${_name}-${pkgver}"
    python setup.py build
}

package() {
    cd "${_name}-${pkgver}"
    python setup.py install --root="$pkgdir" --optimize=1
}

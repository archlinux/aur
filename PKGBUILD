# Maintainer: Khorne <khorne@khorne.me>
pkgname=python-lib4sbom
_name=${pkgname##python-}
pkgver=0.8.8
pkgrel=1
pkgdesc="Library to ingest and generate SBOMs "
arch=('any')
url="https://github.com/anthonyharrison/lib4sbom"
license=('Apache-2.0')
depends=('python' 'python-yaml' 'python-semantic-version' 'python-defusedxml' 'python-pytest')
makedepends=('python-setuptools' 'python-pytest')
source=("${_name}-${pkgver}.tar.gz::https://github.com/anthonyharrison/${_name}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('955bf4eb5bbd1275e7d35d58c571811b1382fe541acd395cce2fcfc2775b9619')

build() {
    cd "${_name}-${pkgver}"
    python setup.py build
}

package() {
    cd "${_name}-${pkgver}"
    python setup.py install --root="$pkgdir" --optimize=1
}

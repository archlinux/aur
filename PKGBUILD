# Maintainer: Khorne <khorne@khorne.me>
pkgname=python-lib4sbom
_name=${pkgname##python-}
pkgver=0.7.4
pkgrel=1
pkgdesc="Library to ingest and generate SBOMs "
arch=('any')
url="https://github.com/anthonyharrison/lib4sbom"
license=('Apache-2.0')
depends=('python' 'python-yaml' 'python-semantic-version' 'python-defusedxml' 'python-pytest')
makedepends=('python-setuptools' 'python-pytest')
source=("${_name}-${pkgver}.tar.gz::https://github.com/anthonyharrison/${_name}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('9d17c58732f9d0279ac0ac3f6cd8070ee51114775442ee354e0b0c4138bb081d')

build() {
    cd "${_name}-${pkgver}"
    python setup.py build
}

package() {
    cd "${_name}-${pkgver}"
    python setup.py install --root="$pkgdir" --optimize=1
}

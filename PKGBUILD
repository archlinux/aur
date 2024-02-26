# Maintainer: Khorne <khorne@khorne.me>
pkgname=python-lib4sbom
_name=${pkgname##python-}
pkgver=0.6.2
pkgrel=1
pkgdesc="Library to ingest and generate SBOMs "
arch=('any')
url="https://github.com/anthonyharrison/lib4sbom"
license=('Apache-2.0')
depends=('python' 'python-yaml' 'python-semantic-version' 'python-defusedxml')
makedepends=(python-setuptools)
source=("${_name}-${pkgver}.tar.gz::https://github.com/anthonyharrison/${_name}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('3b208c17ad36d206d3880bb77eb07892cbbe87855f5577fc3929da5a4295fe92')

build() {
    cd "${_name}-${pkgver}"
    python setup.py build
}

package() {
	cd "${_name}-${pkgver}"
        python setup.py install --root="$pkgdir" --optimize=1
}

# Maintainer: J. Nathanael Philipp (jnphilipp) <nathanael@philipp.land>
# Contributor: envolution
# Contributor: Chris Brendel <cdbrendel@gmail.com>

pkgname=python-confection
_name=confection
pkgver=1.3.4
pkgrel=1
pkgdesc="Confection: the sweetest config system for Python"
arch=("x86_64")
url="https://github.com/explosion/confection"
license=("MIT")
depends=("python" "python-pydantic" "python-typing_extensions" "python-srsly")
makedepends=("python-setuptools")
source=("${pkgname}-${pkgver}.tar.gz::${url}/releases/download/release-v${pkgver}/${_name}-${pkgver}.tar.gz")
sha256sums=("560aebbeabaaeee369c54e21afc97953165b2166909ea81e14e341838f4b260d")

build() {
    cd "${_name}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${_name}-${pkgver}"
	  python -m installer -d "${pkgdir}" dist/*.whl
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

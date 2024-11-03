# Maintainer: devome <evinedeng@hotmail.com>

_pkgname=rtfde
_pipname="${_pkgname^^}"
pkgname="python-${_pkgname}"
pkgver=0.1.2
pkgrel=1
pkgdesc="A library for extracting HTML content from RTF encapsulated HTML as commonly found in the exchange MSG email format."
arch=("any")
url="https://github.com/seamustuohy/${_pipname}"
license=('LGPL-3.0-or-later')
depends=("python-lark" "python-oletools")
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
source=("${_pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('e7e65410b10b9d61be3d96b2cd5a7bc88d21ea75d519296925a0cb9631b50d73')

build() {
    cd "${_pipname}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${_pipname}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}

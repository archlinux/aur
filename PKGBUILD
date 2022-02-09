# Maintainer: Razer <razer[AT]neuf[DOT]fr>

pkgname=python-heatshrink2
_pypi_pkgname=heatshrink2
pkgver=0.11.0
pkgrel=1
pkgdesc="Compression using the Heatshrink algorithm in Python 3"
arch=(any)
url="https://github.com/eerimoq/pyheatshrink"
license=('ISC')
makedepends=('python-setuptools')
depends=('python')
optdepends=()
source=("https://pypi.io/packages/source/h/${_pypi_pkgname}/${_pypi_pkgname}-${pkgver}.tar.gz")
sha256sums=('c6286d1d4b92fbaeb83b0fd8b5f831c9350dcd1046e776e5aaa83d1be43835f7')

build() {
    cd "${srcdir}/${_pypi_pkgname}-${pkgver}"
    python setup.py build || return 1
}

package() {
    cd "${srcdir}/${_pypi_pkgname}-${pkgver}"
    python setup.py install --root=${pkgdir} --optimize=1 || return 1
}

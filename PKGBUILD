# Maintainer: Razer <razer[AT]neuf[DOT]fr>

pkgname=python-heatshrink2
_pypi_pkgname=heatshrink2
pkgver=0.13.0
pkgrel=0
pkgdesc="Compression using the Heatshrink algorithm in Python 3"
arch=(any)
url="https://github.com/eerimoq/pyheatshrink"
license=('ISC')
makedepends=('python-setuptools')
depends=('python')
optdepends=()
source=("https://pypi.io/packages/source/h/${_pypi_pkgname}/${_pypi_pkgname}-${pkgver}.tar.gz")
sha256sums=('5aa93c102ba9c4e6e4fb01974cb5b03194e10fa01bfda8bda233c632b22d3b4a')

build() {
    cd "${srcdir}/${_pypi_pkgname}-${pkgver}"
    python setup.py build || return 1
}

package() {
    cd "${srcdir}/${_pypi_pkgname}-${pkgver}"
    python setup.py install --root=${pkgdir} --optimize=1 || return 1
}

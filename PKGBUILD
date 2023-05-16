# Maintainer: Razer <razer[AT]neuf[DOT]fr>

pkgname=python-heatshrink2
_pypi_pkgname=heatshrink2
pkgver=0.12.0
pkgrel=0
pkgdesc="Compression using the Heatshrink algorithm in Python 3"
arch=(any)
url="https://github.com/eerimoq/pyheatshrink"
license=('ISC')
makedepends=('python-setuptools')
depends=('python')
optdepends=()
source=("https://pypi.io/packages/source/h/${_pypi_pkgname}/${_pypi_pkgname}-${pkgver}.tar.gz")
sha256sums=('6fb36a9d8d3e7df350ec777f2a86c7a84d3f6aaa3154d201fe8407ac050df351')

build() {
    cd "${srcdir}/${_pypi_pkgname}-${pkgver}"
    python setup.py build || return 1
}

package() {
    cd "${srcdir}/${_pypi_pkgname}-${pkgver}"
    python setup.py install --root=${pkgdir} --optimize=1 || return 1
}

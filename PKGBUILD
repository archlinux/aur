# Maintainer: Razer <razer[AT]neuf[DOT]fr>

pkgname=python-heatshrink2
_pypi_pkgname=heatshrink2
pkgver=0.10.0
pkgrel=1
pkgdesc="Compression using the Heatshrink algorithm in Python 3"
arch=(any)
url="https://github.com/eerimoq/pyheatshrink"
license=('ISC')
makedepends=('python-setuptools')
depends=('python')
optdepends=()
source=("https://pypi.io/packages/source/h/${_pypi_pkgname}/${_pypi_pkgname}-${pkgver}.tar.gz")
sha256sums=('11261cea2343cfd58c52a1457a909c5da680c0f983b0088234f4fe5016408694')

build() {
    cd "${srcdir}/${_pypi_pkgname}-${pkgver}"
    python setup.py build || return 1
}

package() {
    cd "${srcdir}/${_pypi_pkgname}-${pkgver}"
    python setup.py install --root=${pkgdir} --optimize=1 || return 1
}

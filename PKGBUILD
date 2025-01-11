# Maintainer: taotieren <admin@taotieren.com>

pkgbase=pdcom-gateway
pkgname=(python-pdcom-gateway)
pkgver=0.1.3
pkgrel=2
pkgdesc="PdCom Gateway - This is a tiny python application to implement protocol adaptors."
arch=(any)
url="https://gitlab.com/etherlab.org/pdcom-gateway"
license=('GPL-3.0-or-later')
provides=(${pkgname})
conflicts=(${pkgname})
replaces=()
depends=(
    pdcom
    python
    python-libconf
)
makedepends=(
    python-build
    python-installer
    python-wheel
    python-setuptools
)
checkdepends=()
backup=()
options=()
#install=${pkgname}.install
source=(
    "${pkgbase}-${pkgver}.tar.gz::${url}/-/archive/${pkgver}/${pkgbase}-${pkgver}.tar.gz")

sha256sums=('aaf1aa3dbf72ce302a204ee003f8023f9ea20ab49af1353457379ecd6d0fab26')

build() {
    cd "${srcdir}/${pkgbase}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {

    cd "${srcdir}"/${pkgbase}-${pkgver}/
    python -m installer --destdir="${pkgdir}" dist/*.whl
}

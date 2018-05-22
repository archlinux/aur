# Maintainer: Joseph Brains <jnbrains@gmail.com>
_pkgname=async-timeout
pkgname=python-${_pkgname}-gns3
pkgver=2.0.1
pkgrel=1
pkgdesc='Asyncio-compatible timeout class (GNS3)'
arch=('any')
url="https://github.com/aio-libs/async-timeout"
license=('Apache')
groups=('gns3')
depends=('python')
makedepends=('python-setuptools')
provides=("python-${_pkgname}")
conflicts=("python-${_pkgname}")
source=(${pkgname}-${pkgver}.tar.gz::https://github.com/aio-libs/async-timeout/archive/v${pkgver}.tar.gz)
sha256sums=('75a300199bb1bc11bb79a9ba7525a547ea0d3109000660e4ca57d4069b4544c3')

build() {
    cd ${_pkgname}-${pkgver}
    python3 setup.py build
}

package() {
    cd ${_pkgname}-${pkgver}
    python3 setup.py install --root="${pkgdir}" --optimize=1
}


# Maintainer: Thomas Schneider <thomas.schneider@ruhr-uni-bochum.de>

_pkgname=synapse-s3-storage-provider
pkgname=python3-${_pkgname}
pkgver=1.3.0
pkgrel=1
pkgdesc="Synapse storage provider to fetch and store media in Amazon S3"
arch=('any')
url='https://github.com/matrix-org/synapse-s3-storage-provider'
license=('Apache')
makedepends=('python-setuptools')
depends=('python-boto3' 'matrix-synapse')
source=("${_pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('e0c9ec9cdd7a3e837bc8bf1e2e1376ab8ece858b4944a4b866dbe746d1a1b786')

build() {
    cd ${srcdir}/${_pkgname}-${pkgver}
    python setup.py build
}

package() {
    cd ${_pkgname}-${pkgver}
    python setup.py install --root ${pkgdir}

    install -Dm644 ${srcdir}/${_pkgname}-${pkgver}/LICENSE ${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE
}
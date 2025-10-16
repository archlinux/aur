# Maintainer: Thomas Schneider <thomas.aur@brainfuck.space>

_pkgname=synapse-s3-storage-provider
pkgname=python3-${_pkgname}
pkgver=1.6.0
pkgrel=0
pkgdesc="Synapse storage provider to fetch and store media in Amazon S3"
arch=('any')
url='https://github.com/matrix-org/synapse-s3-storage-provider'
license=('Apache')
makedepends=('python-setuptools')
depends=('python-boto3' 'matrix-synapse' 'python-humanize' 'python-psycopg2' 'python-twisted')
source=("${_pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('41b481fbed95500b40a1e2c31f04b43087ac2266ffa770424bf53eaea0d690f7')

build() {
    cd ${srcdir}/${_pkgname}-${pkgver}
    python setup.py build
}

package() {
    cd ${_pkgname}-${pkgver}
    python setup.py install --root ${pkgdir}

    install -Dm644 ${srcdir}/${_pkgname}-${pkgver}/LICENSE ${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE
}

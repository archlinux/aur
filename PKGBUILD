# Maintainer: Thomas Schneider <thomas.aur@brainfuck.space>

_pkgname=synapse-s3-storage-provider
pkgname=python3-${_pkgname}
pkgver=1.4.0
pkgrel=2
pkgdesc="Synapse storage provider to fetch and store media in Amazon S3"
arch=('any')
url='https://github.com/matrix-org/synapse-s3-storage-provider'
license=('Apache')
makedepends=('python-setuptools')
depends=('python-boto3' 'matrix-synapse')
source=("${_pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('83f32273363006d71a8ab258ea46dedd5280d9f0861e8fef8584bfd61268d931')

build() {
    cd ${srcdir}/${_pkgname}-${pkgver}
    python setup.py build
}

package() {
    cd ${_pkgname}-${pkgver}
    python setup.py install --root ${pkgdir}

    install -Dm644 ${srcdir}/${_pkgname}-${pkgver}/LICENSE ${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE
}

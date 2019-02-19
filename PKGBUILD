# Maintainer: Carlos Mogas da Silva <r3pek@r3pek.org>

pkgname=matrix-synapse-rest-auth
pkgver=0.1.2
pkgrel=1
pkgdesc='REST endpoint Authentication module for synapse'
arch=('any')
url='https://github.com/kamax-io/matrix-synapse-rest-auth'
license=('AGPL3')
depends=('python2' 'python2-twisted' 'matrix-synapse')
source=("https://github.com/kamax-io/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('ee54649b1eec2c0f72930fa3d0a3b5769971c8cbc2bbd0f8476a88ea46570193')

package() {
    cd "${pkgname}-${pkgver}"

    PYTHON_LOCATION=$(python2 -c "from distutils.sysconfig import get_python_lib; print(get_python_lib())")

    # File
    install -dm 755 "${pkgdir}"/${PYTHON_LOCATION}
    install -m 644 rest_auth_provider.py "${pkgdir}"/${PYTHON_LOCATION}/rest_auth_provider.py
}

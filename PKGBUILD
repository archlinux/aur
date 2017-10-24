# Maintainer: Carlos Mogas da Silva <r3pek@r3pek.org>

pkgname=matrix-synapse-rest-auth
pkgver=0.1.1
pkgrel=1
pkgdesc='REST endpoint Authentication module for synapse'
arch=('any')
url='https://github.com/kamax-io/matrix-synapse-rest-auth'
license=('AGPL3')
depends=('python2' 'python2-twisted' 'matrix-synapse')
source=("https://github.com/kamax-io/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('8c9368c5f1ab8e2e3a9788cf4e4ad0bcd197cc68b278efd360edb516e674658d')

package() {
    cd "${pkgname}-${pkgver}"

    PYTHON_LOCATION=$(python2 -c "from distutils.sysconfig import get_python_lib; print(get_python_lib())")

    # File
    install -dm 755 "${pkgdir}"/${PYTHON_LOCATION}/synapse
    install -m 644 rest_auth_provider.py "${pkgdir}"/${PYTHON_LOCATION}/synapse/rest_auth_provider.py
}

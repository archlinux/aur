# Maintainer: Mark Collins <tera_1225 hat hotmail dot com>
# Contributor: Lorenz Steinert <lsteinert@uraziel.de>

pkgname=python-matrix-synapse-shared-secret-auth
_name=${pkgname#python-}
pkgver=2.0.3
pkgrel=2
pkgdesc="Shared Secret Authenticator password provider module for Matrix Synapse"
url="https://github.com/devture/matrix-synapse-shared-secret-auth"
arch=('any')
license=('AGPL')
makedepends=('python-setuptools')
depends=('python' 'matrix-synapse')
source=("${_name}-${pkgver}.tar.gz::https://github.com/devture/${_name}/archive/${pkgver}.tar.gz")
sha256sums=('5de33edd7f9d807a2857029a10e96a39bb25f6bcd7e1a18f438966eb5a9a49f4')

build() {
    cd "${srcdir}/${_name}-${pkgver}"
    python setup.py build
}

package() {
    cd "${srcdir}/${_name}-${pkgver}"
    python setup.py install --root=${pkgdir} --optimize=1 --skip-build
}

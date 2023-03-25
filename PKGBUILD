# Maintainer: Mark Collins <tera_1225 hat hotmail dot com>
# Contributor: Lorenz Steinert <lsteinert@uraziel.de>

pkgname=python-matrix-synapse-shared-secret-auth
_name=${pkgname#python-}
pkgver=2.0.2
pkgrel=2
pkgdesc="Shared Secret Authenticator password provider module for Matrix Synapse"
url="https://github.com/devture/matrix-synapse-shared-secret-auth"
arch=('x86_64')
license=('AGPL')
makedepends=('python-setuptools')
depends=('python' 'matrix-synapse')
source=("https://github.com/devture/${_name}/archive/${pkgver}.tar.gz")
sha256sums=("9fba080679c6fc928f603d44bd9f5ff0ab62155f74b5a7c13b648558b0114858")

build() {
    cd "${srcdir}/${_name}-${pkgver}"
    python setup.py build
}

package() {
    cd "${srcdir}/${_name}-${pkgver}"
    python setup.py install --root=${pkgdir} --optimize=1 --skip-build
}

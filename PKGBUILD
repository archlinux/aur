# Maintainer: Lorenz Steinert <lsteinert@uraziel.de>

pkgname=python-matrix-synapse-shared-secret-auth
_name=${pkgname#python-}
pkgver=2.0.1
pkgrel=2
pkgdesc="Shared Secret Authenticator password provider module for Matrix Synapse"
url="https://github.com/devture/matrix-synapse-shared-secret-auth"
arch=('x86_64')
license=('AGPL')
makedepends=('python-setuptools')
depends=('python' 'matrix-synapse')
source=("https://github.com/devture/${_name}/archive/${pkgver}.tar.gz")
sha256sums=("aa8e698645abd95a2be2fc85041a035711a45c493c396e3de6de283041f59d98")

build() {
    cd "${srcdir}/${_name}-${pkgver}"
    python setup.py build
}

package() {
    cd "${srcdir}/${_name}-${pkgver}"
    python setup.py install --root=${pkgdir} --optimize=1 --skip-build
}

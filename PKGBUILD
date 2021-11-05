# Maintainer: Lorenz Steinert <lsteinert@uraziel.de>

pkgname=python-matrix-synapse-shared-secret-auth
_name=${pkgname#python-}
pkgver=2.0
pkgrel=0
pkgdesc="Shared Secret Authenticator password provider module for Matrix Synapse"
url="https://github.com/devture/matrix-synapse-shared-secret-auth"
arch=('x86_64')
license=('AGPL')
makedepends=('python-setuptools')
depends=('python' 'matrix-synapse')
source=("https://github.com/devture/${_name}/archive/${pkgver}.tar.gz")
sha256sums=("817d2c4e4e889c6f12369bb8855e5673a56e7390370a50be9fdfc5e853c986c9")

build() {
    cd "${srcdir}/${_name}-${pkgver}"
    python setup.py build
}

package() {
    cd "${srcdir}/${_name}-${pkgver}"
    python setup.py install --root=${pkgdir} --optimize=1 --skip-build
}

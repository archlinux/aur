# Maintainer: Lorenz Steinert <lsteinert@uraziel.de>

pkgname=python-matrix-synapse-shared-secret-auth
_name=${pkgname#python-}
pkgver=1.0.2
pkgrel=0
pkgdesc="Shared Secret Authenticator password provider module for Matrix Synapse"
url="https://github.com/devture/matrix-synapse-shared-secret-auth"
arch=('x86_64')
license=('AGPL')
makedepends=('python-setuptools')
depends=('python' 'python-twisted')
source=("https://github.com/devture/${_name}/archive/${pkgver}.tar.gz")
sha256sums=("ebbd3bb6dea556c6cd1021fe67a3f9e852158e068660c62ca0381fa633b93e95")

build() {
    cd "${srcdir}/${_name}-${pkgver}"
    python setup.py build
}

package() {
    cd "${srcdir}/${_name}-${pkgver}"
    python setup.py install --root=${pkgdir} --optimize=1 --skip-build
}

# Maintainer: Lorenz Steinert <lsteinert@uraziel.de>

pkgname=python-matrix-synapse-shared-secret-auth-git
_name=$( expr "${pkgname}" : "python-\(.*\)-git" )
provides=('python-matrix-synapse-shared-secret-auth')
conflicts=('python-matrix-synapse-shared-secret-auth')
pkgver=2
pkgrel=1
pkgdesc="Shared Secret Authenticator password provider module for Matrix Synapse"
url="https://github.com/devture/matrix-synapse-shared-secret-auth"
arch=('any')
license=('AGPL')
makedepends=('python-setuptools')
depends=('python' 'matrix-synapse')
source=("git+https://github.com/devture/${_name}.git")
sha256sums=(SKIP)

build() {
    cd "${srcdir}/${_name}"
    python setup.py build
}

package() {
    cd "${srcdir}/${_name}"
    python setup.py install --root=${pkgdir} --optimize=1 --skip-build
}

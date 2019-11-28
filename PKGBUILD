# Maintainer: Stefan Tatschner <stefan@rumpelsepp.org>

pkgname=python-kitty
# _module='kitty'
pkgver=0.7.4
pkgrel=1
pkgdesc="Fuzzing framework written in python"
url="https://github.com/"
depends=('python')
makedepends=('python-setuptools')
license=('GPL')
arch=('any')
source=("$pkgname::git+https://github.com/cisco-sas/kitty#tag=v${pkgver}")
sha256sums=('SKIP')

build() {
    cd "${srcdir}/${pkgname}"
    python setup.py build
}

package() {
    cd "${srcdir}/${pkgname}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}

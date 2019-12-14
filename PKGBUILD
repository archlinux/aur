# Maintainer: Stefan Tatschner <stefan@rumpelsepp.org>
# Contributor: bitwave <aur@oomlu.de>

pkgname=python-boofuzz
pkgver=0.1.6
pkgrel=1
pkgdesc="A fork and successor of the Sulley Fuzzing Framework"
url="https://github.com/jtpereyda/boofuzz"
depends=('python' 'python-pyserial' 'python-tornado' 'python-pydot')
makedepends=('python-setuptools')
license=('GPL')
arch=('any')
source=("$pkgname::git+https://github.com/jtpereyda/boofuzz#tag=v$pkgver")
sha256sums=('SKIP')

build() {
    cd "${srcdir}/${pkgname}"
    python setup.py build
}

package() {
    cd "${srcdir}/${pkgname}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}

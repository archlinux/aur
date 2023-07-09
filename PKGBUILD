# Maintainer: Philip May <eniak.info@gmail.com>

pkgname=python-configparser
_pkgname=configparser
pkgver=6.0.0
pkgrel=1
pkgdesc='backport of configparser from Python 3'
arch=('any')
url='https://github.com/jaraco/configparser/'
license=('MIT')
depends=('python')
makedepends=(
    'python-setuptools'
    'python-pip'
    'python-wheel'
)
source=("git+https://github.com/jaraco/${_pkgname}.git#tag=v${pkgver}")
sha256sums=('SKIP')

build() {
    cd "${srcdir}/${_pkgname}"
    python setup.py build
}

package() {
    cd "${srcdir}/${_pkgname}"
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}

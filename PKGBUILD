# Maintainer: Nicolás Demarchi <mail@gilgamezh.me>

pkgname=fades
pkgver=3
pkgrel=1
pkgdesc="FAst DEpendencies for Scripts."
url="https://github.com/PyAr/fades/"
arch=('any')
depends=('python' 'python-setuptools')
optdepends=('python-xdg: Used to correctly get user folders', 'python-virtualenv: Used to support different Python versions for child execution.')
license=('GPL3')
source=(https://pypi.python.org/packages/source/f/fades/fades-${pkgver}.tar.gz)
md5sums=('78bebd9cfa792c3f5a270c80b8c994fc')

build() {
    cd ${srcdir}/fades-${pkgver}
    python setup.py build
}

package() {
    cd ${srcdir}/fades-${pkgver}
    python setup.py install --root="${pkgdir}" --optimize=1
}

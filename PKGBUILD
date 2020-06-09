# Maintainer: Nicolás Demarchi <mail@gilgamezh.me>

pkgname=fades
pkgver=9.0
pkgrel=2
pkgdesc="FAst DEpendencies for Scripts."
url="https://github.com/PyAr/fades/"
arch=('any')
depends=('python' 'python-setuptools')
optdepends=('python-xdg: Used to correctly get user folders', 'python-virtualenv: Used to support different Python versions for child execution.')
license=('GPL3')
source=(https://files.pythonhosted.org/packages/cd/b0/381b14139b36dcbd317349ce7c2bd2e2a66bfc772d13e568d71f3d98d977/fades-9.0.tar.gz)
sha256sums=('77192b76efbd08dfabce65fe6012805a2383ec1b893c12091efe35fbfd9677f6')

build() {
    cd ${srcdir}/fades-${pkgver}
    python setup.py build
}

package() {
    cd ${srcdir}/fades-${pkgver}
    python setup.py install --root="${pkgdir}" --optimize=1
}

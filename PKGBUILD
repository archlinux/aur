# Maintainer: Nicolás Demarchi <mail@gilgamezh.me>

pkgname=fades
pkgver=9.0.2
pkgrel=1
pkgdesc="FAst DEpendencies for Scripts."
url="https://github.com/PyAr/fades/"
arch=('any')
depends=('python' 'python-setuptools')
optdepends=('python-xdg: Used to correctly get user folders', 'python-virtualenv: Used to support different Python versions for child execution.')
license=('GPL3')
source=(https://files.pythonhosted.org/packages/8b/e8/87a44f1c33c41d1ad6ee6c0b87e957bf47150eb12e9f62cc90fdb6bf8669/fades-9.0.2.tar.gz)
sha256sums=('4a2212f48c4c377bbe4da376c4459fe2d79aea2e813f0cb60d9b9fdf43d205cc')

build() {
    cd ${srcdir}/fades-${pkgver}
    python setup.py build
}

package() {
    cd ${srcdir}/fades-${pkgver}
    python setup.py install --root="${pkgdir}" --optimize=1
}

# Maintainer: Nicolás Demarchi <mail@gilgamezh.me>

pkgname=fades
pkgver=8.1
pkgrel=1.0
pkgdesc="FAst DEpendencies for Scripts."
url="https://github.com/PyAr/fades/"
arch=('any')
depends=('python' 'python-setuptools')
optdepends=('python-xdg: Used to correctly get user folders', 'python-virtualenv: Used to support different Python versions for child execution.')
license=('GPL3')
source=(https://files.pythonhosted.org/packages/8b/9c/fd93dff7d8665b704c2f008009876118971df691f8e5bd662befdb8f574c/fades-8.1.tar.gz)
sha256sums=('c9ba065b59e9b6a2ab6fb6f65cd71a17e9fc97f543d5c975a4f9841a51d49317')

build() {
    cd ${srcdir}/fades-${pkgver}
    python setup.py build
}

package() {
    cd ${srcdir}/fades-${pkgver}
    python setup.py install --root="${pkgdir}" --optimize=1
}

# Maintainer: Jean-Gabriel Young <info@jgyoung.ca>

pkgname=python-webweb
pkgver=0.0.37
pkgrel=1
pkgdesc="An easy-to-use network visualization tool."
arch=('i686' 'x86_64')
url='https://webwebpage.github.io/'
license=(GPLv3+)
_name=${pkgname#python-}
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('66e2ff6e5749cf99e36f8a821e972fa20008b67332745b93b22a775a4c3cfe10')
build() {
    cd ${_name}-${pkgver}
    python setup.py build
}

package() {
    cd ${_name}-${pkgver}
    python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}

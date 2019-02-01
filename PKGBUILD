# Maintainer: Jean-Gabriel Young <info@jgyoung.ca>

pkgname=python-webweb
pkgver=0.0.18
pkgrel=1
pkgdesc="An easy-to-use network visualization tool."
arch=('i686' 'x86_64')
url='https://webwebpage.github.io/'
license=(GPLv3+)
_name=${pkgname#python-}
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('3ff9a4dd08dc4a36879f6b23d162df8be00df8b77948476b7a754472d492053c')
build() {
    cd ${_name}-${pkgver}
    python setup.py build
}

package() {
    cd ${_name}-${pkgver}
    python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}

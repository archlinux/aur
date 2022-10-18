# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>
pkgname=python-wtforms-alchemy
_pkgname=wtforms-alchemy
pkgver=0.18.0
pkgrel=1
pkgdesc='Tools for creating wtforms from sqlalchemy models'
arch=('any')
url="https://wtforms-alchemy.readthedocs.io"
license=('BSD')
depends=('python-arrow' 'python-babel' 'python-colour' 'python-dateutil' 'python-intervals' 'python-passlib' 'python-phonenumbers' 'python-wtforms-components') 
checkdepends=('python-wtforms-test')
source=("$pkgname-$pkgver.tar.gz::https://github.com/kvesteri/wtforms-alchemy/archive/$pkgver.tar.gz")
sha256sums=('77f39fa3caf9c6f1db9f2d7a55b3c9f33caf82da9541958ac0fdd8b9740b43b5')

build() {
    cd "${_pkgname}-${pkgver}"
    python setup.py build
}

package() {
    cd "${_pkgname}-${pkgver}"
    python setup.py install --skip-build --root="${pkgdir}" --optimize=1
    install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

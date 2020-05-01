# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>
pkgname=python-wtforms-alchemy
_pkgname=wtforms-alchemy
pkgver=0.16.9
pkgrel=1
pkgdesc='Tools for creating wtforms from sqlalchemy models'
arch=('any')
url="https://wtforms-alchemy.readthedocs.io"
license=('BSD')
depends=('python-arrow' 'python-babel' 'python-colour' 'python-dateutil' 'python-intervals' 'python-passlib' 'python-phonenumbers' 'python-wtforms-components') 
checkdepends=('python-wtforms-test')
source=("$pkgname-$pkgver.tar.gz::https://github.com/kvesteri/wtforms-alchemy/archive/$pkgver.tar.gz")
sha256sums=('53d734ad026cea39a7a9e09bf524a5d8a2025ee6958a4f7d4b0aa0a8f27d519f')

build() {
    cd "$srcdir/${_pkgname}-${pkgver}"

    python setup.py build
}

package() {
    cd "$srcdir/${_pkgname}-${pkgver}"

    python setup.py install --root="${pkgdir}" --optimize=1
    install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

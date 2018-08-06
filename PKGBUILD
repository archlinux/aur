# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>
pkgname=python-wtforms-alchemy
_pkgname=wtforms-alchemy
pkgver=0.16.7
pkgrel=1
pkgdesc='Tools for creating wtforms from sqlalchemy models'
arch=('any')
url="https://wtforms-alchemy.readthedocs.io"
license=('BSD')
depends=('python-arrow' 'python-babel' 'python-colour' 'python-dateutil' 'python-intervals' 'python-passlib' 'python-phonenumbers' 'python-wtforms-components') 
checkdepends=('python-wtforms-test')
source=("https://github.com/kvesteri/wtforms-alchemy/archive/$pkgver.tar.gz")
sha256sums=('b177e05e243ac1ffbe52307cf1cb5ccb5e3843cb8f465db0dec152dc884f6cdf')

build() {
    cd "$srcdir/${_pkgname}-${pkgver}"

    python setup.py build
}

package() {
    cd "$srcdir/${_pkgname}-${pkgver}"

    python setup.py install --root="${pkgdir}" --optimize=1
    install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

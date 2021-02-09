# Maintainer: Sebastian Lau <slau@slau.info>
# Maintainer: Dennis Fink <dennis.fink@c3l.lu>

pkgname=python-flask-qrcode
_pkgname=Flask-QRcode
pkgver=3.0.0
pkgrel=1
pkgdesc="Flask-QRcode is a concise Flask extension to easily render QR codes on Jinja2 templates using python-qrcode."
arch=('any')
url="https://marcoagner.github.io/Flask-QRcode/"
license=('GPL3')
depends=('python' 'python-flask' 'python-qrcode')
source=("https://github.com/marcoagner/${_pkgname}/archive/v${pkgver}.tar.gz")
sha512sums=('f8ceaca3799e9e01c6c68ace8ef909c4e5a6e2133a0f53d8d8221a0cf84352713d53237924d510305ed43755803d5458b4bad4e3bd978f53ebb98ac0b9792d5d')

build() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1
}

# vim:set ts=2 sw=2 et; 

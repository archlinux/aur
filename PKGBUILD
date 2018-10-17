# Maintainer: Dennis Fink <dennis.fink@c3l.lu>

pkgname=python-flask-qrcode
_pkgname=Flask-QRcode
pkgver=2.0.2
pkgrel=1
pkgdesc="Flask-QRcode is a concise Flask extension to easily render QR codes on Jinja2 templates using python-qrcode."
arch=('any')
url="https://marcoagner.github.io/Flask-QRcode/"
license=('GPL3')
depends=('python' 'python-flask' 'python-qrcode')
source=(https://github.com/marcoagner/$_pkgname/archive/v$pkgver.tar.gz)
sha512sums=('0d5d59e28c0099422a3f1f8b7d53fb3eb3cd7b83431c0029f2c00077f3f07742ec821fb3e2d6b08760d427a2f8155c63164e6f227766994e4fbb92e4da70c1e8')

build() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1
}

# vim:set ts=2 sw=2 et; 

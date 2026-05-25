# Maintainer: Agil Mammadov <mammadovagil@tutamail.com>
# Contributor: Sebastian Lau <slau@slau.info>
# Contributor: Dennis Fink <dennis.fink@c3l.lu>

pkgname=python-flask-qrcode
_pkgname=Flask-QRcode
pkgver=3.2.0
pkgrel=1
pkgdesc="Flask-QRcode is a concise Flask extension to easily render QR codes on Jinja2 templates using python-qrcode."
arch=('any')
url="https://marcoagner.github.io/Flask-QRcode/"
license=('GPL-3.0-only')
depends=(python python-flask python-qrcode python-pillow)
source=("$_pkgname-$pkgver.tar.gz::https://github.com/marcoagner/${_pkgname}/archive/v${pkgver}.tar.gz")
sha512sums=('3ebfc8e11da9f479679ce13ffaec830538dc10b3e3db3cafdd301ff1d8d87d0a07632a591d12395658c4ef3d9c4658f6320c3d3ca38ce7a5003f6498e71a1429')

build() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1
}

# vim:set ts=2 sw=2 et; 

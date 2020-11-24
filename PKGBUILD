# Maintainer: Michael Gerhaeuser <michael.gerhaeuser@gmail.com>
pkgname=lektor
_pkgname=Lektor
pkgver=3.2.0
pkgrel=1
pkgdesc="A static content management system."
arch=(any)
url="https://www.getlektor.com"
license=('BSD')
depends=(python python-pip python-requests python-babel
    python-flask python-watchdog python-click python-pyasn1
    python-ndg-httpsclient python-mistune python-inifile python-exifread)
makedepends=(python-setuptools)
options=(!emptydirs)
source=("https://files.pythonhosted.org/packages/source/L/$_pkgname/$_pkgname-$pkgver.tar.gz")
sha256sums=('5ab0c55aaea3cb98efdbf33b44adfd8291d0724e8849892eb13767d5cdb1fe40')

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1

  # license
  install -Dm 644 LICENSE \
    "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
}

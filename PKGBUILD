# Maintainer: Michael Gerhaeuser <michael.gerhaeuser@gmail.com>
pkgname=lektor
_pkgname=Lektor
pkgver=3.1.3
pkgrel=2
pkgdesc="A static content management system."
arch=(any)
url="https://www.getlektor.com"
license=('BSD')
depends=(python2 python2-pip python2-requests python2-babel python2-functools32
    python2-flask python2-watchdog python2-click python2-pyasn1
    python2-ndg-httpsclient python2-mistune python2-inifile python-exifread)
makedepends=(python2-setuptools)
options=(!emptydirs)
source=("https://files.pythonhosted.org/packages/source/L/$_pkgname/$_pkgname-$pkgver.tar.gz")
sha256sums=('60a83e7a100780a58553324b396b0df32a2f584452184efbf87acefed85e564d')

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1

  # license
  install -Dm 644 LICENSE \
    "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
}

# Maintainer: Kewl <xrjy@nygb.rh.bet(rot13)>

pkgname=python-exchange_calendars
_pkgname=${pkgname#python-}
pkgver=3.3
pkgrel=1
pkgdesc="Calendars for various securities exchanges"
arch=('any')
depends=('python-numpy' 'python-pandas' 'python-dateutil' 'python-pytz' 'python-pyluach' 'python-toolz')
makedepends=('python-setuptools')
url="https://github.com/gerrymanoim/$_pkgname"
license=('APACHE')
source=("https://files.pythonhosted.org/packages/source/${_pkgname:0:1}/$_pkgname/$_pkgname-$pkgver.tar.gz")
sha256sums=('d5178a3c49b5778e2ebee554e9c0b4a73f126650f1313e881a682013b0d8beb7')

build() {
  cd $_pkgname-$pkgver
  python setup.py build
}

package() {
  cd $_pkgname-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}

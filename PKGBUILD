# Maintainer: Kewl <xrjy@nygb.rh.bet(rot13)>

pkgname=python-exchange_calendars
_pkgname=${pkgname#python-}
pkgver=3.6.1
pkgrel=1
pkgdesc="Calendars for various securities exchanges"
arch=('any')
depends=('python-numpy' 'python-pandas' 'python-dateutil' 'python-pytz' 'python-pyluach' 'python-toolz' 'python-korean_lunar_calendar')
makedepends=('python-setuptools')
url="https://github.com/gerrymanoim/$_pkgname"
license=('APACHE')
source=("https://files.pythonhosted.org/packages/source/${_pkgname:0:1}/$_pkgname/$_pkgname-$pkgver.tar.gz")
sha256sums=('7aaf89ffba9a6023858f09a9ff734a0f5785362ad7855aaa714a06063f54b2c1')

build() {
  cd $_pkgname-$pkgver
  python setup.py build
}

package() {
  cd $_pkgname-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}

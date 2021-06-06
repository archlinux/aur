# Maintainer: Kewl <xrjy@nygb.rh.bet(rot13)>

pkgname=python-exchange_calendars
_pkgname=${pkgname#python-}
pkgver=3.1.0
pkgrel=1
pkgdesc="Calendars for various securities exchanges"
arch=('any')
depends=('python-numpy' 'python-pandas' 'python-dateutil' 'python-pytz' 'python-pyluach' 'python-toolz')
makedepends=('python-setuptools')
url="https://github.com/gerrymanoim/$_pkgname"
license=('APACHE')
source=("https://files.pythonhosted.org/packages/source/${_pkgname:0:1}/$_pkgname/$_pkgname-$pkgver.tar.gz")
sha256sums=('92d9ddbbe6750d0603460faa151e9e506adc0e50db34a3446710aa032d3621c7')

build() {
  cd $_pkgname-$pkgver
  python setup.py build
}

package() {
  cd $_pkgname-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}

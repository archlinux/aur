# Maintainer: Joseph Smidt <josephsmidt@gmail.com>
# Maintainer: Kewl <xrjy@nygb.rh.bet(rot13)>

pkgname=python-trading_calendars
_pkgname=${pkgname#python-}
pkgver=2.1.1
pkgrel=1
pkgdesc="A Python library of exchange calendars meant to be used with Zipline."
arch=('any')
depends=('python-numpy' 'python-pandas' 'python-dateutil' 'python-pytz' 'python-pyluach' 'python-toolz')
makedepends=('python-setuptools')
url="https://github.com/quantopian/$_pkgname"
license=('APACHE')
source=($pkgname-$pkgver.tar.gz::"$url/archive/$pkgver.tar.gz")
md5sums=('451e10803eda53e2f99f74b53db4b75c')

build() {
  cd $_pkgname-$pkgver
  python setup.py build
}

package() {
  cd $_pkgname-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}

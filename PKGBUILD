# Maintainer: Joseph Smidt <josephsmidt@gmail.com>

_pkgname=trading_calendars
pkgname=python-$_pkgname
pkgver=1.11.7
pkgrel=1
pkgdesc="A Python library of exchange calendars meant to be used with Zipline."
arch=('any')
url="https://github.com/quantopian/trading_calendars"
license=('APACHE')
depends=('python-matplotlib' 'python-numpy' 'python-pandas'
         'python-dateutil' 'python-pytz' 'python-logbook' 'python-toolz')
makedepends=('python-setuptools')
source=($pkgname-$pkgver.tar.gz::"$url/archive/$pkgver.tar.gz")
sha256sums=('e11d5b1927f0911dba1efa83b7cc04103b5ece5e4d658a5d8c286b1aaa35599f')

build() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py install --prefix=/usr --root="$pkgdir" -O1 --skip-build
}

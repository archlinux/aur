# maintainer Storm Dragon <stormdragon2976@gmail.com>

pkgname='python-txtorcon'
_pkgname='txtorcon'
pkgver=20.0.0
pkgrel=2
pkgdesc='A Twisted-based Python asynchronous controller library for Tor'
arch=('any')
url='https://txtorcon.readthedocs.org/'
license=('MIT')
depends=('python-geoip' 'python-twisted')
makedepends=('python-setuptools')
source=("${_pkgname}-${pkgver}.tar.gz::https://github.com/meejah/$_pkgname/archive/v$pkgver.tar.gz")
sha512sums=('8a685140f69d993a2a7808c862059bcaceee74d413ab380c13cfdade7d5749d0a8db5a3c10267050102d75a7bd66c62e327b9300d5b34e2cdc4649a2c60cc9af')

build() {
  cd "$srcdir"/${_pkgname}-${pkgver}
  python setup.py build
}
 
package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:

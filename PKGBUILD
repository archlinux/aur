# maintainer Storm Dragon <stormdragon2976@gmail.com>

pkgname='python-txtorcon'
_pkgname='txtorcon'
pkgver=19.1.0
pkgrel=2
pkgdesc='A Twisted-based Python asynchronous controller library for Tor'
arch=('any')
url='https://txtorcon.readthedocs.org/'
license=('MIT')
depends=('python-geoip' 'python-twisted')
makedepends=('python-setuptools' 'python2-setuptools')
source=("${_pkgname}-${pkgver}.tar.gz::https://github.com/meejah/$_pkgname/archive/v$pkgver.tar.gz")
sha512sums=('749cc25b1e62998a72b36535b1b2c29045a6098312f582c9e12334a28c49fd608616bab0ef6de39921ab2ea8a69f95cd1bf5c224eeb4c873f1d9062643ec5eb9')

build() {
  cd "$srcdir"/${_pkgname}-${pkgver}
  python setup.py build
}
 
package_python-txtorcon() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:

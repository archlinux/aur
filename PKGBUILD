# Maintainer: Nicolas Pouillard <nicolas.pouillard@gmail.com>
# Contributor: Peter Simons <simons@cryp.to>
pkgname=pycryptopp
pkgver=0.6.0
_pkgtag=1206569328141510525648634803928199668821045408958
pkgrel=2
pkgdesc="Python wrappers for the Crypto++ library"
arch=('i686' 'x86_64')
url='http://allmydata.org/trac/pycryptopp'
license=('GPL')
depends=('python2' 'crypto++')
makedepends=('darcsver' 'setuptools_darcs')
source=( http://pypi.python.org/packages/source/p/$pkgname/$pkgname-$pkgver.$_pkgtag.tar.gz
         http://pypi.python.org/packages/source/p/$pkgname/$pkgname-$pkgver.$_pkgtag.tar.gz.asc )
md5sums=('ce38fbe03705d27da408c78b56eb1947'
         '76fe2da5b1fc964d9e1ee4596c36d5bf')

build() {
  cd "$srcdir/$pkgname-$pkgver.$_pkgtag"
  export PYCRYPTOPP_DISABLE_EMBEDDED_CRYPTOPP=1
  python2 setup.py build
  python2 setup.py test
}

package() {
  cd "$srcdir/$pkgname-$pkgver.$_pkgtag"
  python2 setup.py install --root="$pkgdir"
}

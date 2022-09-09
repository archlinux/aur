# Maintainer: Michal Wojdyla < micwoj9292 at gmail dot com >
# Contributor: Andy Weidenbaum <archbaum@gmail.com>

pkgname=python2-pysodium
pkgver=0.7.12
pkgrel=2
pkgdesc="Python wrapper for libsodium"
arch=('any')
depends=('libsodium' 'python2')
makedepends=('python2-setuptools')
url="https://github.com/stef/pysodium"
license=('BSD')
options=(!emptydirs)
source=(https://pypi.io/packages/source/p/pysodium/pysodium-$pkgver.tar.gz)
sha256sums=('3e9005c770dca021889b2fe77db7ffa3c2e98fcac7e3cc1e8e157b9ed78f1fc8')

build() {
  cd "$srcdir/${pkgname#python2-}-$pkgver"
  python2 setup.py build
}

check() {
  cd "$srcdir/${pkgname#python2-}-$pkgver"
  python2 setup.py test
}

package() {
  cd "$srcdir/${pkgname#python2-}-$pkgver"
  python2 setup.py install --root="$pkgdir" --optimize=1
}

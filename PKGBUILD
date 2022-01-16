# Maintainer: Michal Wojdyla < micwoj9292 at gmail dot com >
# Contributor: Andy Weidenbaum <archbaum@gmail.com>

pkgname=python2-pysodium
pkgver=0.7.11
pkgrel=1
pkgdesc="Python wrapper for libsodium"
arch=('any')
depends=('libsodium' 'python2')
makedepends=('python2-setuptools')
url="https://github.com/stef/pysodium"
license=('BSD')
options=(!emptydirs)
source=(https://pypi.io/packages/source/p/pysodium/pysodium-$pkgver.tar.gz)
sha256sums=('1a739ff00606595f5e818d9f1414ea82a0c75aed6ba6778f580e52cb5ff6a625')

build() {
  cd "$srcdir/${pkgname#python2-}-$pkgver"
  python2 setup.py build
}

package() {
  cd "$srcdir/${pkgname#python2-}-$pkgver"
  python2 setup.py install --root="$pkgdir" --optimize=1
}

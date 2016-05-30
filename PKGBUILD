# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=python2-pysodium
pkgver=0.6.9
pkgrel=1
pkgdesc="Python wrapper for libsodium"
arch=('any')
depends=('libsodium' 'python2' 'python2-cffi')
makedepends=('python2-setuptools')
url="https://github.com/stef/pysodium"
license=('BSD')
options=(!emptydirs)
source=(https://pypi.python.org/packages/d9/d1/1410c02a9bf07f96fa839d429d4db884f3edc3f6fa89ef8320f116991135/pysodium-0.6.9.tar.gz)
md5sums=('cfc813df50a23b6dd9e0d2f10530fa95')
sha256sums=('baee63ea350c0e810bec5837913b1c3291501ad2833bca195fe13a7d4023d942')

build() {
  cd "$srcdir/${pkgname#python2-}-$pkgver"

  msg2 'Building...'
  python2 setup.py build
}

package() {
  cd "$srcdir/${pkgname#python2-}-$pkgver"

  msg2 'Installing...'
  python2 setup.py install --root="$pkgdir" --optimize=1
}

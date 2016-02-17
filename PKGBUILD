# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=python2-sasl
pkgver=0.2.1
pkgrel=1
pkgdesc="Cyrus-SASL bindings for Python"
arch=('i686' 'x86_64')
depends=('python2' 'python2-six')
makedepends=('gcc' 'libsasl' 'python2-setuptools')
url="https://github.com/toddlipcon/python-sasl"
license=('Apache')
options=(!emptydirs)
source=(https://pypi.python.org/packages/source/s/${pkgname#python2-}/${pkgname#python2-}-$pkgver.tar.gz)
md5sums=('ca093d9a3d6f20b79b964a5e5add0202')
sha256sums=('04f22e17bbebe0cd42471757a48c2c07126773c38741b1dad8d9fe724c16289d')

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

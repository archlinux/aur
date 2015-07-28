# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=python2-sasl
pkgver=0.1.3
pkgrel=1
pkgdesc="Cyrus-SASL bindings for Python"
arch=('i686' 'x86_64')
depends=('python2')
makedepends=('gcc' 'libsasl' 'python2-setuptools')
url="https://github.com/toddlipcon/python-sasl"
license=('Apache')
options=(!emptydirs)
source=(https://pypi.python.org/packages/source/s/${pkgname#python2-}/${pkgname#python2-}-$pkgver.tar.gz)
md5sums=('6db4ca3d4fb699cf126a6e6f2f516d8f')
sha256sums=('4f324226e1ee85ac41520579ba9de703294012602e536217fd0e7456e147d886')

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

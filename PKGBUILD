# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=python2-pysodium
pkgver=0.6.8
pkgrel=1
pkgdesc="Python wrapper for libsodium"
arch=('any')
depends=('libsodium' 'python2' 'python2-cffi')
makedepends=('python2-setuptools')
url="https://github.com/stef/pysodium"
license=('BSD')
options=(!emptydirs)
source=(https://pypi.python.org/packages/source/p/${pkgname#python2-}/${pkgname#python2-}-$pkgver.tar.gz)
md5sums=('87190c18b5e60e1e4bde88fd9580e856')
sha256sums=('e7935601aa66b491c5d3427b518046083273266e8e0a756c96f4c888742110cb')

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

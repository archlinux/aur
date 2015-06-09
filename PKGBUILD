# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=python2-pyethash
pkgver=23.1
pkgrel=1
pkgdesc="Python wrappers for ethash, the Ethereum proof of work hashing function"
arch=('i686' 'x86_64')
depends=('python2')
makedepends=('gcc' 'python2-setuptools')
groups=('ethereum')
url="https://github.com/ethereum/ethash"
license=('GPL')
options=(!emptydirs)
source=(https://pypi.python.org/packages/source/p/${pkgname#python2-}/${pkgname#python2-}-$pkgver.tar.gz)
md5sums=('bdb22f4a88fb0c0e8f5da5fad0c840cc')
sha256sums=('1e001fe8b75b5c86e60a0685b3e6a0f1b02df494629240c720ffdcf991e518be')

build() {
  cd "$srcdir/${pkgname#python2-}-$pkgver"

  msg 'Installing...'
  python2 setup.py build
}

package() {
  cd "$srcdir/${pkgname#python2-}-$pkgver"

  msg 'Installing...'
  python2 setup.py install --root="$pkgdir" --optimize=1
}

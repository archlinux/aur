# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=python2-pyethash
pkgver=0.1.27
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
md5sums=('0ede7aff7f9279b2451ecdb187b91590')
sha256sums=('ff66319ce26b9d77df1f610942634dac9742e216f2c27b051c0a2c2dec9c2818')

build() {
  cd "$srcdir/${pkgname#python2-}-$pkgver"

  msg2 'Installing...'
  python2 setup.py build
}

package() {
  cd "$srcdir/${pkgname#python2-}-$pkgver"

  msg2 'Installing...'
  python2 setup.py install --root="$pkgdir" --optimize=1
}

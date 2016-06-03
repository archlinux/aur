# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=python2-pysodium
pkgver=0.6.9.1
pkgrel=1
pkgdesc="Python wrapper for libsodium"
arch=('any')
depends=('libsodium' 'python2' 'python2-cffi')
makedepends=('python2-setuptools')
url="https://github.com/stef/pysodium"
license=('BSD')
options=(!emptydirs)
source=(https://pypi.python.org/packages/1c/7b/140b954748b466564e7e4d6728cf02109d52999a15f7f6cdce4532542440/pysodium-0.6.9.1.tar.gz)
md5sums=('bc75db081121773a1978f740f2728097')
sha256sums=('0629f5c7c36dfa5a52bbeaebf4b93c70a00c0e50ba9b722fd7793ea620e6ba03')

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

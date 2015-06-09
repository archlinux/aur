# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=python2-ltc_scrypt
pkgver=1.0
pkgrel=1
pkgdesc="Bindings for scrypt proof of work used by Litecoin"
arch=('i686' 'x86_64')
depends=('python2' 'scrypt')
makedepends=('python2-setuptools')
url="https://pypi.python.org/pypi/ltc_scrypt"
license=('unknown')
options=(!emptydirs)
source=(https://pypi.python.org/packages/source/l/${pkgname#python2-}/${pkgname#python2-}-$pkgver.tar.gz)
md5sums=('7d019c3c98f16eb466a272e518ffb014')
sha256sums=('a6a0bd2fb439c3ddb86b5de32ff65827c58726956dea278ffe27121e078420c1')

build() {
  cd $srcdir/${pkgname#python2-}-$pkgver

  msg 'Building...'
  python2 setup.py build
}

package() {
  cd $srcdir/${pkgname#python2-}-$pkgver

  msg 'Installing...'
  python2 setup.py install --root="$pkgdir" --optimize=1
}

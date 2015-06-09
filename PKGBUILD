# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=python2-pbp
pkgver=0.3.1
pkgrel=1
pkgdesc="Simple crypto tool"
arch=('any')
depends=('libsodium' 'python2' 'python2-cffi' 'python2-pysodium' 'python2-scrypt' 'python2-securestring' 'scrypt')
makedepends=('gcc' 'python2-setuptools')
optdepends=('python2-pyusb: PITCHFORK support')
url="https://github.com/stef/pbp"
license=('AGPL3')
options=(!emptydirs)
source=(https://pypi.python.org/packages/source/p/${pkgname#python2-}/${pkgname#python2-}-$pkgver.tar.gz)
md5sums=('7b02092d0af7ea80541d167db3be3639')
sha256sums=('c8690905956ae1bc9d5733252d94a68c7d0c44244dcdf9ec5529c6e33b3b5b4a')
provides=('pbp' 'python2-pbp')
conflicts=('pbp' 'python2-pbp')
install=pbp.install

build() {
  cd "$srcdir/${pkgname#python2-}-$pkgver"

  msg 'Building...'
  python2 setup.py build
}

package() {
  cd "$srcdir/${pkgname#python2-}-$pkgver"

  msg 'Installing...'
  python2 setup.py install --root="$pkgdir" --optimize=1
}

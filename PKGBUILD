# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=python2-waitress
pkgver=0.8.10
pkgrel=1
pkgdesc="Pure-Python WSGI server"
arch=('any')
depends=('python2')
makedepends=('python2-setuptools')
url="https://github.com/Pylons/waitress"
license=('ZPL')
options=(!emptydirs)
source=(https://pypi.python.org/packages/source/w/${pkgname#python2-}/${pkgname#python2-}-$pkgver.tar.gz)
md5sums=('a957f79c1b56224660a5b68c8ef29c8b')
sha256sums=('7c40c1af0f0c254edb25153621a1e825bc1af2f7bf41a74b4bb8ee6d544ef604')

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

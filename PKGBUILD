# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=python2-waitress
pkgver=0.8.9
pkgrel=1
pkgdesc="Pure-Python WSGI server"
arch=('any')
depends=('python2')
makedepends=('python2-setuptools')
url="https://github.com/Pylons/waitress"
license=('ZPL')
options=(!emptydirs)
source=(https://pypi.python.org/packages/source/w/${pkgname#python2-}/${pkgname#python2-}-$pkgver.tar.gz)
md5sums=('da3f2e62b3676be5dd630703a68e2a04')
sha256sums=('826527dc9d334ed4ed76cdae672fdcbbccf614186657db71679ab58df869458a')

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

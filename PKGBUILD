# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=python2-hyp
pkgver=1.0.0
pkgrel=1
pkgdesc="Partial JSON API implementation in Python on top of Schematics"
arch=('any')
depends=('python2' 'python2-inflection' 'python2-marshmallow' 'python2-schematics')
makedepends=('python2-setuptools')
url="https://github.com/kalasjocke/hyp"
license=('MIT')
options=(!emptydirs)
source=(https://pypi.python.org/packages/source/h/${pkgname#python2-}/${pkgname#python2-}-$pkgver.tar.gz)
md5sums=('a86281d94c76fbf08f65e3ebee24183e')
sha256sums=('4bdf1f3af1bb20ca621cc5fa21b79c048f5aad39280c14c81d2402efebad54aa')

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

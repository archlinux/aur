# Maintainer: Lex Black <autumn-wind at web dot de>
# Contributor: Henri Häkkinen <henuxd@gmail.com>

# A version for Python2.x is placed in the branch Python2
# If you decide to use the python2 version don't forget to adjust the dep

_pkgname=translate
pkgname=translate-git
pkgver=0.3.0
pkgrel=1
pkgdesc="Google Translator command line interface"
arch=('any')
url="https://github.com/Narrat/translate.git"
license=('GPL3')
depends=('python')
makedepends=('git')
source=('git://github.com/Narrat/translate.git#branch=master')
md5sums=('SKIP')


pkgver() {
  cd $_pkgname
  git describe | sed 's/^v//;s/-/./g'
}

package() {
  cd "$srcdir/$_pkgname"
  make DESTDIR=$pkgdir PREFIX="/usr" install
}

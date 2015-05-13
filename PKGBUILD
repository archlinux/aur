# Maintainer: Lex Black <autumn-wind at web dot de>
# Contributor: Henri Häkkinen <henuxd@gmail.com>

_pkgname=cli-google
pkgname=cli-google-git
pkgver=0.2.0
pkgrel=1
pkgdesc="Google Search from command line"
arch=('any')
url='https://github.com/henux/cli-google.git'
license=('GPL3')
depends=('python')
makedepends=('git')
provides=('cli-google')
conflicts=('cli-google')
source=('git://github.com/Narrat/cli-google.git')
md5sums=('SKIP')


pkgver() {
  cd $_pkgname
  git describe |  sed 's/^v//;s/-/./g'
}

package() {
  cd "$srcdir/$_pkgname"
  make DESTDIR=$pkgdir PREFIX="/usr" install
}

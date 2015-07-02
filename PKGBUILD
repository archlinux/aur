# Maintainer: Clément Démoulins <clement@archivel.fr>

pkgname=tvdb_api-git
_realname=tvdb_api
pkgver=20140401
pkgrel=2
pkgdesc="easy to use interface to thetvdb.com"
arch=('any')
url="http://github.com/dbr/tvdb_api/"
license=('GPL')
depends=('python2')
makedepends=('git' 'python2' 'python2-setuptools')
provides=('tvdb_api')
conflicts=('tvdb_api')

source=(${_realname}::git://github.com/dbr/tvdb_api.git)
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/${_realname}"
  git log -1 --format="%cd" --date=short | tr -d '-'
}

build() {
  cd "$srcdir/${_realname}"
  python2 setup.py build
}

package() {
  cd "$srcdir/${_realname}"
  python2 setup.py install --root=$pkgdir/ --optimize=1
}

# vim:set ts=2 sw=2 et:

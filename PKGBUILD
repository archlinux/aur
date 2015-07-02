# Contributor: hur1can3 <hur1can3@hotmail.com>
# Maintainer: Clément Démoulins <clement@archivel.fr>

pkgname=tvnamer-git
_realname=tvnamer
pkgver=20130403
pkgrel=3
pkgdesc="Automatic TV episode file renamer using Python, It uses data from thetvdb.com via tvdb_api."
arch=('any')
url="http://github.com/dbr/tvnamer/"
license=('GPL')
depends=('python2-simplejson' 'tvdb_api-git')
makedepends=('git' 'python2-setuptools')
provides=('tvnamer')

source=(${_realname}::git://github.com/dbr/tvnamer.git)
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
  python2 setup.py install --root="$pkgdir" --optimize=1
}
# vim:set ts=2 sw=2 et:

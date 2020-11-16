# Maintainer: e dot sovetkin at gmaildotcom
pkgname=smrender-git
pkgver=19cfbd8
pkgrel=1
pkgdesc="smrender"
arch=('any')
url="http://www.abenteuerland.at/smrender/"
license=('GPLv3')
depends=()
makedepends=('git')
conflicts=()
provides=('smrender')
source=('git+https://github.com/rahra/smrender.git')
md5sums=('SKIP')
_gitname=smrender

pkgver () {
  cd $_gitname
  echo $(git describe --always | sed 's/-/./g')
}

build() {
  cd $_gitname
  ./configure
  make
}

package () {
  cd $_gitname
  make DESTDIR=$pkgdir install
}

# vim:set ts=4 sw=4 et:


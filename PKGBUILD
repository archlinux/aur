# Maintainer: Stelios Tsampas <zeronebones (at) gmail (dot) com>
pkgname=honpurple-git
pkgver=0.6
pkgrel=1
pkgdesc="libpurple plugin for the Heroes of Newerth chat server"
arch=('i686' 'x86_64')
url="https://github.com/theli-ua/honpurple"
license=('GPL')
depends=("libpurple" "glib2")
makedepends=("git")
conflicts=('honpurple' 'honpurple-svn')
source=('repo::git+https://github.com/theli-ua/honpurple.git')
md5sums=('SKIP')

build() {
  cd "$srcdir/repo"
  make || return 1 # build/compile from source
}

package() {
  cd "$srcdir/repo"
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:

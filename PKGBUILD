# Maintainer: Thibault Guittet <guittet dot thibault at gmail dot com>
_pkgname=connman-ncurses
pkgname=$_pkgname-git
pkgver=20150726
pkgrel=1
pkgdesc="Simple ncurses UI for ConnMan"
arch=('any')
url="https://github.com/eurogiciel-oss/connman-json-client"
license=('GPL2')
depends=('json-c' 'ncurses' 'connman')
makedepends=('git')
provides=("$_pkgname=$pkgver")
source=("git://github.com/eurogiciel-oss/connman-json-client.git")
sha256sums=("SKIP")

_gitroot="connman-json-client"

build() {
  cd "$srcdir/$_gitroot"
  ./run-me.sh
}

package() {
  install -Dm733 "$srcdir/$_gitroot/connman_ncurses" "$pkgdir/usr/bin/$_pkgname"
}

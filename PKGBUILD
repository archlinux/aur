# Submitter: Dmitrij Podabed <dmitrij at podabed dot org>
# Maintainer: Dmitrij Podabed <dmitrij at podabed dot org>
pkgname=connman-ncurses
pkgver=1.0
pkgrel=1
pkgdesc="Simple ncurses UI for ConnMan"
arch=('any')
url="https://github.com/eurogiciel-oss/connman-json-client"
license=('GPL2')
depends=('json-c' 'ncurses' 'connman')
makedepends=('git')
provides=("$pkgname=$pkgver")
source=("git://github.com/eurogiciel-oss/connman-json-client/commit/cb0f024e8741b9d5765a1b6fe85c755dfb1515d7.git")
sha256sums=("SKIP")

_gitroot="connman-json-client"

build() {
  cd "$srcdir/$_gitroot"
  ./run-me.sh
}

package() {
  install -Dm733 "$srcdir/$_gitroot/connman_ncurses" "$pkgdir/usr/bin/$_pkgname"
}
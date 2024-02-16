# Maintainer: Riderius <riderius.help@gmail.com>
# Previous maintainer: Kevin Kuehler <keur@xcf.berkeley.edu>

pkgname='git-quick-stats'
pkgver='2.5.4'
pkgrel=2
pkgdesc='Simple and efficient way to access various statistics in git repository'
arch=('any')
url="https://github.com/arzzen/$pkgname"
license=('MIT')
depends=(
  'bash'
  'coreutils'
  'gawk'
  'git'
  'grep'
  'ncurses'
  'util-linux'
)
makedepends=()
provides=('git-quick-stats')
conflicts=('git-quick-stats')
source=("$pkgname::git+$url#tag=$pkgver")
sha256sums=('SKIP')

check() {
  cd "$srcdir/$pkgname"
  make test
}

package() {
  cd "$srcdir/$pkgname"
  make DESTDIR="$pkgdir" PREFIX=/usr install
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

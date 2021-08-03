# Maintainer: Kevin Kuehler <keur@xcf.berkeley.edu>

pkgname='git-quick-stats'
pkgver='2.3.0'
pkgrel=1
pkgdesc='`git-quick-stats` is a simple and efficient way to access various statistics in git repository.'
arch=('x86_64')
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

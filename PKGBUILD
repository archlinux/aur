# Maintainer: Riderius <riderius.help@gmail.com>
# Contributor: Kevin Kuehler <keur@xcf.berkeley.edu>
# Contributor: Thomas Gläßle <t_glaessle@gmx.de>

pkgname='git-quick-stats'
pkgver='2.5.7'
pkgrel=1
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
makedepends=('git')
provides=('git-quick-stats')
conflicts=('git-quick-stats')
source=("$pkgname::git+$url#tag=$pkgver")
sha256sums=('abaac17a09ba4ca8243a4287626fc0cef49bacf24679fdf78ebd07eea7a7071d')

check() {
  cd "$srcdir/$pkgname"
  make test
}

package() {
  cd "$srcdir/$pkgname"
  make DESTDIR="$pkgdir" PREFIX=/usr install
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

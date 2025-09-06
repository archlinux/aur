# Maintainer: Riderius <riderius.help@gmail.com>
# Contributor: Kevin Kuehler <keur@xcf.berkeley.edu>
# Contributor: Thomas Gläßle <t_glaessle@gmx.de>

pkgname='git-quick-stats'
pkgver='2.8.0'
pkgrel=1
pkgdesc='Simple and efficient way to access various statistics in git repository'
arch=('any')
url="https://github.com/$pkgname/$pkgname"
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
provides=('git-quick-stats')
conflicts=('git-quick-stats')
source=("$pkgname::git+$url#tag=$pkgver")
sha256sums=('6134eace2e8d7eb27e718aedc97f1d114c16e9a06ba70148f539c82ede849327')

check() {
  cd "$srcdir/$pkgname"
  make test
}

package() {
  cd "$srcdir/$pkgname"
  make DESTDIR="$pkgdir" PREFIX=/usr install
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# Maintainer: Riderius <riderius.help@gmail.com>
# Contributor: Kevin Kuehler <keur@xcf.berkeley.edu>
# Contributor: Thomas Gläßle <t_glaessle@gmx.de>

pkgname='git-quick-stats'
pkgver='2.6.2'
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
sha256sums=('0000138849aa488d1c13baabcea76a51e988a07dccefaef9c7e0541943f4452b')

check() {
  cd "$srcdir/$pkgname"
  make test
}

package() {
  cd "$srcdir/$pkgname"
  make DESTDIR="$pkgdir" PREFIX=/usr install
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

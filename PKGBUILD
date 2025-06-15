# Maintainer: Riderius <riderius.help@gmail.com>
# Contributor: Kevin Kuehler <keur@xcf.berkeley.edu>
# Contributor: Thomas Gläßle <t_glaessle@gmx.de>

pkgname='git-quick-stats'
pkgver='2.6.1'
pkgrel=1
pkgdesc='Simple and efficient way to access various statistics in git repository'
arch=('any')
url="https://github.com/$pkgname/$pkgname"
license=('MIT')
depends=(
  'bash'
  'git'
)
provides=('git-quick-stats')
conflicts=('git-quick-stats')
source=("$pkgname::git+$url#tag=$pkgver")
sha256sums=('0de8268ec1cd613f40dc0e21d6a64b3e972713ba8866a96dfbd89d5d3d14b9cd')

check() {
  cd "$srcdir/$pkgname"
  make test
}

package() {
  cd "$srcdir/$pkgname"
  make DESTDIR="$pkgdir" PREFIX=/usr install
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

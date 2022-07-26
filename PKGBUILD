# Contributor: Lukasz Michalski <lm@zork.pl>
pkgname=check_lsi_raid-git
pkgver=r195.e4e88f1
pkgrel=1
pkgdesc="Nagios/Icinga plugin to check LSI RAID Controllers"
arch=(any)
url=https://github.com/thomas-krenn/check_lsi_raid
license=(GPL3)
depends=(perl-file-which)
makedepends=(git)

source=("check_lsi_raid::git+https://github.com/thomas-krenn/check_lsi_raid.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/check_lsi_raid"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$srcdir/check_lsi_raid"
  install -D -m755 check_lsi_raid "$pkgdir/usr/lib/monitoring-plugins/check_lsi_raid"
}

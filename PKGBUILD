# Maintainer: Chad "crossroads1112" Sharp <crossroads1112@riseup.net>
pkgname=pacupg
pkgver=r259.a2c2258
pkgrel=1
pkgdesc="Script that wraps package and AUR upgrades in btrfs snapshots and provides an easy way to roll them back"
arch=('any')
url="https://github.com/crossroads1112/bin/tree/master/pacupg"
license=('GPL')
depends=('pacman' 'bash' 'package-query' 'rsync' 'snapper' 'btrfs-progs' 'coreutils')
optdepends=('pacaur: AUR support' 'grub-btrfs: Add btrfs snapshots to grub menu')
makedepends=()
source=(git+https://github.com/crossroads1112/bin.git)
md5sums=(SKIP)
install="${pkgname%-*}.install"

pkgver() {
  cd "bin"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$srcdir/bin"
  install -Dm0755 pacupg/pacupg      "$pkgdir/usr/bin/pacupg"
  install -Dm0644 pacupg/pacupg.1    "$pkgdir/usr/share/man/man1/pacupg.1"
}

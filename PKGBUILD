# Maintainer: Pedro Henrique Quitete Barreto <pedrohqb@gmail.com>
pkgname=pacman-hook-bootbackup
pkgver=1.0.0
pkgrel=1
pkgdesc="Pacman hooks to create pre- and post-transaction backups of the /boot directory."
arch=('any')
url="https://wiki.archlinux.org/title/System_backup#Snapshots_and_/boot_partition"
license=('GFDL-1.3-or-later')
depends=('rsync')
source=("55-bootbackup_pre.hook" "95-bootbackup_post.hook")
sha256sums=('abf1e78483cea4b21de14036bec79decfc641351cf504e648488faac956caf2a'
            'bd6cca7167936c8ff50726d49be01139b7d8e3d0265af08ea97601990b2e6cc8')

package() {
  install -Dm644 "$srcdir/55-bootbackup_pre.hook" "$pkgdir/etc/pacman.d/hooks/55-bootbackup_pre.hook"
  install -Dm644 "$srcdir/95-bootbackup_post.hook" "$pkgdir/etc/pacman.d/hooks/95-bootbackup_post.hook"
}

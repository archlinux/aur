pkgname=btrbackup
pkgver=0.7
pkgrel=1
pkgdesc="A tcl script for backups from one btrfs filesystem to another using snapshots"
url="https://github.com/TestudoAquatilis/btrbackup"
arch=('any')
license=('GPLv3')
depends=('tcl' 'btrfs-progs' 'rsync')
optdepends=()
makedepends=('git')
conflicts=()
replaces=()
backup=('etc/btrbackupconfig.tcl')
#install='foo.install'
source=("git+https://github.com/TestudoAquatilis/btrbackup.git")
md5sums=('SKIP')

package() {
  cd "${srcdir}/${pkgname}"
  install -Dm744 btrbackup.tcl "$pkgdir/usr/bin/btrbackup"
  install -Dm644 btrbackupconfig.tcl "$pkgdir/etc/btrbackupconfig.tcl"
  install -Dm644 logrotate "$pkgdir/etc/logrotate.d/btrbackup"
}

# vim:set ts=2 sw=2 et:

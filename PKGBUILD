# Maintainer: Gabby <28601 dash gabby at users dot noreply dot gitlab dot freedesktop dot org>
# Maintainer: Julien <aur dot arch at fastmail dot com>
pkgname=snapper-rollback
pkgver=1.0
pkgrel=1
pkgdesc='Script to rollback snapper snapshots as described here https://wiki.archlinux.org/index.php/Snapper#Suggested_filesystem_layout'
arch=('any')
license=('GPL3')
url='https://github.com/jrabinow/snapper-rollback'
depends=('coreutils' 'python' 'btrfs-progs')
makedepends=('git')
provides=('snapper-rollback')
conflicts=('rollback-git')
replaces=('rollback-git')
backup=(etc/snapper-rollback.conf)
install=snapper-rollback.install
source=(git+"https://github.com/jrabinow/snapper-rollback.git")
sha256sums=('SKIP')

package() {
    cd snapper-rollback
    install -Dm644  "snapper-rollback.conf" -t "$pkgdir/etc/"
    install -Dm755  "snapper-rollback.py" "$pkgdir/usr/bin/snapper-rollback"
}

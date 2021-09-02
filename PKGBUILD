# Maintainer: Gabby <28601 dash gabby at users dot noreply dot gitlab dot freedesktop dot org>
pkgname=rollback-git
pkgver=r6.e691387
pkgrel=2
pkgdesc='Script to rollback to snapper snapshot using the layout proposed in the snapper arch wiki page https://wiki.archlinux.org/index.php/Snapper#Suggested_filesystem_layout'
arch=('any')
license=('GPL3')
url='https://gitlab.freedesktop.org/Gabby/rollback'
depends=('coreutils' 'python' 'btrfs-progs')
optdepends=('doas: Automatic priv escalation'
            'sudo: Automatic priv escalation')
makedepends=('git')
provides=('rollback')
conflicts=('rollback')
backup=(etc/rollback.conf)
source=(git+"https://gitlab.freedesktop.org/Gabby/rollback.git")
md5sums=('SKIP')

pkgver() {
	cd "rollback"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd "rollback"
    install -Dm644  "rollback.conf" -t "$pkgdir/etc/"
    install -Dm755  "rollback" -t "$pkgdir/usr/bin/"
}


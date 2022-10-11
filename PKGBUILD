# Maintainer: Drew Nutter <dnut@users.noreply.github.com>
pkgname=upgrade
pkgver=0.2.0
pkgrel=1
pkgdesc='Simplify system upgrades'
url='https://github.com/dnut/upgrade'
source=("git+https://github.com/dnut/upgrade#tag=$pkgver")
backup=("etc/upgrade.ini")
arch=('i686' 'pentium4' 'x86_64' 'arm' 'armv7h' 'armv6h' 'aarch64')
license=('GPL3')
makedepends=()
depends=('paru' 'kernel-modules-hook')
optdepends=()
sha256sums=('SKIP')
install=$pkgname.install
backup=etc/upgrade.conf

build() {
    echo
}

package() {
    cd "$srcdir/$pkgname"

    install -Dm755 upgrade "${pkgdir}/usr/bin/upgrade"
    install -Dm755 clearpkgcache "${pkgdir}/usr/bin/clearpkgcache"

    install -Dm644 upgrade.service "${pkgdir}/etc/systemd/system/upgrade.service"
    install -Dm644 upgrade.timer "${pkgdir}/etc/systemd/system/upgrade.timer"
    
    install -Dm640 upgrade.sudoers "${pkgdir}/etc/sudoers.d/upgrade"
    install -Dm644 upgrade.conf "${pkgdir}/etc/upgrade.conf"
}

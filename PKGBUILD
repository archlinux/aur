# Maintainer : sputnick <gilles *DOT* quenot *AT* gmail *DOT *com>
pkgname=fortune-mod-bashfr
pkgver=11
pkgrel=1
pkgdesc="bashfr.org/DTC (danstonchat.com) fortune file"
url="https://danstonchat.com"
source=( 'https://sputnick.fr/scripts/bashfr' 'https://sputnick.fr/scripts/bashfr-cron' )
depends=('fortune-mod')
groups=('fortune-mods')
install='fortune-mod-bashfr.install'
arch=('any')
sha256sums=('SKIP' 'f2909bd355c9d8befa0c7b1dfb00cf52cd553d98f3975f53824e6ca6ff77b1e3')
license=('custom')

build() {
    true
}

package() {
    strfile -s -r bashfr bashfr.dat
    install -D -m644 bashfr $pkgdir/usr/share/fortune/fr/bashfr
    install -D -m644 bashfr.dat $pkgdir/usr/share/fortune/fr/bashfr.dat
    install -D -m755 bashfr-cron $pkgdir/etc/cron.weekly/bashfr
}

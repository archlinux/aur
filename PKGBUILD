# Maintainer : sputnick <gilles *DOT* quenot *AT* gmail *DOT *com>
pkgname=fortune-mod-bashfr
pkgver=233
pkgrel=1
pkgdesc="bashfr.org/DTC (danstonchat.com) fortune file"
url="http://danstonchat.com"
source=( 'http://sputnick.fr/scripts/bashfr' 'http://sputnick.fr/scripts/bashfr-cron' )
depends=('fortune-mod')
groups=('fortune-mods')
install='fortune-mod-bashfr.install'
arch=('any')
sha256sums=('SKIP' 'af7e9447c3c7072a337d6fbc0bd8d8bc26a4b9a1fe6643bd2ada0164b656c07a')
license="custom"

build() {
    true
}

package() {
    strfile -s -r bashfr bashfr.dat
    install -D -m644 bashfr $pkgdir/usr/share/fortune/fr/bashfr
    install -D -m644 bashfr.dat $pkgdir/usr/share/fortune/fr/bashfr.dat
    install -D -m755 bashfr-cron $pkgdir/etc/cron.weekly/bashfr
}

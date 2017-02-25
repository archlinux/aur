# Maintainer: Silvio Knizek <killermoehre@gmx.net>
pkgname=reflector-timer
pkgver=7
pkgrel=1
pkgdesc='A service and timer for the reflector mirrorlist upgrade.'
arch=('any')
url='http://xyne.archlinux.ca/projects/reflector/'
license=('GPL')
depends=('reflector' 'systemd')
backup=('etc/conf.d/reflector.conf')
source=('reflector.service'
        'reflector.timer'
        'reflector.conf')
md5sums=('a7c75b59e15235725183f348c62577f0'
         '3d73c16ef89e6defb15f23787fd35808'
         '59bbdabd80e9c4dc3c17e0c7a1304bcd')

package() {
    install -D -m 644 'reflector.service' "$pkgdir/usr/lib/systemd/system/reflector.service"
    install -D -m 644 'reflector.timer' "$pkgdir/usr/lib/systemd/system/reflector.timer"
    install -D -m 644 'reflector.conf' "$pkgdir/usr/share/reflector-timer/reflector.conf"
}

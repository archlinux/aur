# Maintainer: Daniel Menelkir <dmenelkir at gmail dot com>

pkgname=g15daemon-systemd
pkgver=20220622
pkgrel=1
pkgdesc="g15daemon init script for systemd"
arch=('any')
url="https://gitlab.com/menelkir/g15daemon"
license=('GPL2')
depends=('g15daemon' 'systemd')
_filename='g15daemon.service'
source=("https://gitlab.com/menelkir/g15daemon/-/raw/master/contrib/init/g15daemon.service"
        "https://gitlab.com/menelkir/g15daemon/-/raw/master/contrib/udev/99-g15daemon.rules")
sha256sums=('7d91cf893fbad9d3bc7ccf318aa27d2c89b94036e8433a6f8f7732f2be4669bb'
             '1a12cb587d175d4a06bfc0b6be8d19c0824fe7b58eef887dcaa19b92727c6ae7')

package() {
    install -D -m 644 "g15daemon.service" "${pkgdir}/usr/lib/systemd/system/g15daemon.service"
    install -D -m 644 "99-g15daemon.rules" "${pkgdir}/etc/udev/rules.d/99-g15daemon.rules"
}

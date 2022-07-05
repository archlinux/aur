# Maintainer: Daniel Menelkir <dmenelkir at gmail dot com>

pkgname=g15daemon-systemd
pkgver=20220705
pkgrel=1
pkgdesc="g15daemon init script for systemd"
arch=('any')
url="https://gitlab.com/menelkir/g15daemon"
license=('GPL2')
depends=('g15daemon' 'systemd')
_filename='g15daemon.service'
source=("https://gitlab.com/menelkir/g15daemon/-/raw/master/contrib/init/g15daemon.service"
        "https://gitlab.com/menelkir/g15daemon/-/raw/master/contrib/udev/99-g15daemon.rules"
        "https://gitlab.com/menelkir/g15daemon/-/raw/master/contrib/init/g15daemon-hotplug")
sha256sums=('ab02974d62766c419508223bc930c8fe6151fd43727a67e6fdfec81bb0a77da0'
             '1a12cb587d175d4a06bfc0b6be8d19c0824fe7b58eef887dcaa19b92727c6ae7'
             '2a0a52864c40805bf6fe7a91a0b6ce660d7744ba43456143e64988f8038da47d')

package() {
    install -D -m 644 "g15daemon.service" "${pkgdir}/usr/lib/systemd/system/g15daemon.service"
    install -D -m 644 "99-g15daemon.rules" "${pkgdir}/etc/udev/rules.d/99-g15daemon.rules"
    install -D -m 755 "g15daemon-hotplug" "${pkgdir}/usr/bin/g15daemon-hotplug"
}

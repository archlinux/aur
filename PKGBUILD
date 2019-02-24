# Maintainer: Robert Maerz
# Contributor: Aline Freitas <aline AT alinefreitas DOT com DOT br>

pkgname=mkinitcpio-bluetooth
pkgver=1.3
pkgrel=1
pkgdesc="This is an initcpio hook for bluetooth connectivity during boot / in initramfs."
url="https://github.com/irreleph4nt/mkinitcpio-bluetooth/"
arch=('x86_64' 'i686')
license=('GPLv2')
depends=('bluez' 'bluez-utils' 'dbus')
makedepends=('git')
source=("git+https://github.com/irreleph4nt/mkinitcpio-bluetooth.git#tag=v${pkgver}")
md5sums=('SKIP')

package() {
    cd "$srcdir/${pkgname}"  

    install -Dm644 bluetooth_install "${pkgdir}/usr/lib/initcpio/install/bluetooth"
    install -Dm644 bluetooth_hook "${pkgdir}/usr/lib/initcpio/hooks/bluetooth"
    install -Dm644 org.bluez.conf "${pkgdir}/usr/lib/initcpio/bluetooth/org.bluez.conf"
}

# vim:set ts=2 sw=2 et:

# Maintainer: Burkhard Pauli <burkhard at pauli dot tech>
pkgname=zwift-bootstrap-bin
pkgver=0.5.0
pkgrel=1
pkgdesc="Unofficial native Linux launcher for Zwift that installs, updates and starts the game with Wine"
arch=('x86_64')
url="https://github.com/bpauli/zwift-bootstrap"
license=('Apache-2.0 OR MIT')
depends=('dbus' 'gcc-libs' 'glibc' 'libcap')
optdepends=('wine: run the game'
            'bluez: Bluetooth LE sensors'
            'libnotify: notification when an update fails')
provides=('zwift-bootstrap')
conflicts=('zwift-bootstrap')
install=zwift-bootstrap-bin.install
source=("${url}/releases/download/v${pkgver}/zwift-bootstrap_${pkgver}_linux_amd64.tar.gz")
sha256sums=('ecb7273340358691cecd3f5b886c88ac61dec4af7cc678a24332152fa10abd58')

package() {
    install -Dm755 zwift-bootstrap "${pkgdir}/usr/bin/zwift-bootstrap"
    install -Dm755 zwift-bootstrap-ble "${pkgdir}/usr/bin/zwift-bootstrap-ble"
    install -Dm755 contrib/zwift-start "${pkgdir}/usr/bin/zwift-start"
    install -Dm644 contrib/zwift.desktop "${pkgdir}/usr/share/applications/zwift-bootstrap.desktop"
    install -Dm644 LICENSE-MIT "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-MIT"
    install -Dm644 LICENSE-APACHE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-APACHE"
}

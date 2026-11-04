# Maintainer: Burkhard Pauli <burkhard at pauli dot tech>
pkgname=zwift-bootstrap-bin
pkgver=0.3.0
pkgrel=1
pkgdesc="Unofficial native Linux launcher for Zwift that installs, updates and starts the game with Wine"
arch=('x86_64')
url="https://github.com/bpauli/zwift-bootstrap"
license=('Apache-2.0 OR MIT')
depends=('dbus' 'gcc-libs' 'glibc')
optdepends=('wine: run the game'
            'bluez: Bluetooth LE sensors'
            'libnotify: notification when an update fails')
provides=('zwift-bootstrap')
conflicts=('zwift-bootstrap')
source=("${url}/releases/download/v${pkgver}/zwift-bootstrap_${pkgver}_linux_amd64.tar.gz")
sha256sums=('cf93477d2af956850b75f6f9a01636a1dd061b8a0a23331ade531cd68b873101')

package() {
    install -Dm755 zwift-bootstrap "${pkgdir}/usr/bin/zwift-bootstrap"
    install -Dm755 contrib/zwift-start "${pkgdir}/usr/bin/zwift-start"
    install -Dm644 contrib/zwift.desktop "${pkgdir}/usr/share/applications/zwift-bootstrap.desktop"
    install -Dm644 LICENSE-MIT "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-MIT"
    install -Dm644 LICENSE-APACHE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-APACHE"
}

# Maintainer: Burkhard Pauli <burkhard at pauli dot tech>
pkgname=zwift-bootstrap-bin
pkgver=0.1.1
pkgrel=1
pkgdesc="Unofficial native Linux launcher for Zwift that installs, updates and starts the game with Wine"
arch=('x86_64')
url="https://github.com/bpauli/zwift-bootstrap"
license=('Apache-2.0 OR MIT')
depends=('gcc-libs' 'glibc')
optdepends=('wine: run the game'
            'libnotify: notification when an update fails')
provides=('zwift-bootstrap')
conflicts=('zwift-bootstrap')
source=("${url}/releases/download/v${pkgver}/zwift-bootstrap_${pkgver}_linux_amd64.tar.gz")
sha256sums=('abfb8a1a487ae425d749872c561dc101fc160739164683e939f364e286741f89')

package() {
    install -Dm755 zwift-bootstrap "${pkgdir}/usr/bin/zwift-bootstrap"
    install -Dm755 contrib/zwift-start "${pkgdir}/usr/bin/zwift-start"
    install -Dm644 contrib/zwift.desktop "${pkgdir}/usr/share/applications/zwift-bootstrap.desktop"
    install -Dm644 LICENSE-MIT "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-MIT"
    install -Dm644 LICENSE-APACHE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-APACHE"
}

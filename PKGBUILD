# Maintainer: Justin Kromlinger <hashworks@archlinux.org>

pkgname="roundcubemail-plugin-twofactor-webauthn"
pkgver=1.2.0
pkgrel=1
pkgdesc="Roundcube plugin for FIDO2/WebAuthn 2-factor authentication"
url="https://github.com/bartnv/twofactor_webauthn"
license=("GPL3")
arch=("any")
depends=("roundcubemail")
source=("${pkgname}-v${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('09e29d57a67fe1d9d1dc5db948693f33ade393f2e17c52bcf631ae999a39bbd2')
options=("!strip")

package() {
    cd "twofactor_webauthn-${pkgver}"
    install -d "${pkgdir}/usr/share/webapps/roundcubemail/plugins/twofactor_webauthn"
    cp -r ./* "${pkgdir}/usr/share/webapps/roundcubemail/plugins/twofactor_webauthn"

    install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}

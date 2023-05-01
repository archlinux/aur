# Maintainer: k1f0 <generic@k1f0.mozmail.com>
_pkgname=yubioath-desktop-beta
pkgname=${_pkgname}-bin
pkgver=6.2.0
pkgrel=1
pkgdesc="Crossplatform graphical user interface for YubiKeys"
arch=('x86_64')
url="https://github.com/Yubico/yubioath-flutter"
license=('Apache 2.0')
depends=('pcsclite' 'ccid' 'gnome-screenshot')
makedepends=()
validpgpkeys=()
options=(!strip)
source=("${_pkgname}-${pkgver}::${url}/releases/download/${pkgver}/yubico-authenticator-${pkgver}-linux.tar.gz")
sha256sums=("6304b8a345914fd9869fab94b3492f50706b0f536c0aeedc3404968de1766536")

package() {
    cd yubioath-desktop-${pkgver}-linux

    # application
    install -dm 755 "${pkgdir}/opt/${_pkgname}"
    cp -r * "${pkgdir}/opt/${_pkgname}"

    # executable
    install -dm 755 "${pkgdir}/usr/bin"
    ln -s "/opt/${_pkgname}/authenticator" "${pkgdir}/usr/bin/${_pkgname}"
}

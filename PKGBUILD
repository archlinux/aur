# Maintainer: k1f0 <generic@k1f0.mozmail.com>
_pkgname=yubioath-desktop-beta
pkgname=${_pkgname}-bin
pkgver=6.0.0
pkgrel=3
pkgdesc="Crossplatform graphical user interface for YubiKey one-time passwords"
arch=('x86_64')
url="https://www.yubico.com/blog/introducing-yubico-authenticator-6-for-desktop/"
license=('Apache 2.0')
depends=('pcsclite' 'ccid' 'gnome-screenshot')
makedepends=()
validpgpkeys=()
options=(!strip)
source=("https://developers.yubico.com/yubioath-flutter/Releases/yubico-authenticator-6.0.0-linux.tar.gz")
sha256sums=("fa8d275adc336ff24fcdd26a9d454bd3bfc4cdaee6e3a0390f2f426170900be4")

package() {
    cd yubico-authenticator-${pkgver}-linux

    # application
    install -dm 755 "${pkgdir}/opt/${_pkgname}"
    cp -r * "${pkgdir}/opt/${_pkgname}"

    # executable
    install -dm 755 "${pkgdir}/usr/bin"
    ln -s "/opt/${_pkgname}/authenticator" "${pkgdir}/usr/bin/${_pkgname}"
}

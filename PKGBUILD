# Maintainer: k1f0 <generic@k1f0.mozmail.com>
_pkgname=yubioath-desktop-beta
pkgname=${_pkgname}-bin
pkgver=6.1.0
pkgrel=1
pkgdesc="Crossplatform graphical user interface for YubiKey one-time passwords"
arch=('x86_64')
url="https://www.yubico.com/blog/introducing-yubico-authenticator-6-for-desktop/"
license=('Apache 2.0')
depends=('pcsclite' 'ccid' 'gnome-screenshot')
makedepends=()
validpgpkeys=()
options=(!strip)
source=("https://github.com/Yubico/yubioath-flutter/releases/download/$pkgver/yubico-authenticator-6.1.0-linux.tar.gz")
sha256sums=("be686148475d642027d6126ea0984578aa2c22a179a565dc24b81b72ea457417")

package() {
    cd yubico-authenticator-${pkgver}-linux

    # application
    install -dm 755 "${pkgdir}/opt/${_pkgname}"
    cp -r * "${pkgdir}/opt/${_pkgname}"

    # executable
    install -dm 755 "${pkgdir}/usr/bin"
    ln -s "/opt/${_pkgname}/authenticator" "${pkgdir}/usr/bin/${_pkgname}"
}

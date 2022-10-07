# Maintainer: k1f0 <generic@k1f0.mozmail.com>
_pkgname=yubioath-desktop-beta
pkgname=${_pkgname}-bin
pkgver=6.0.0
pkgrel=2
pkgdesc="Crossplatform graphical user interface for YubiKey one-time passwords"
arch=('x86_64')
url="https://www.yubico.com/blog/introducing-yubico-authenticator-6-for-desktop/"
license=('BSD')
depends=('pcsclite' 'ccid' 'gnome-screenshot')
makedepends=()
validpgpkeys=()
options=(!strip)
source=("https://developers.yubico.com/yubioath-desktop/Beta/yubioath-desktop-6.0.0-beta.1-linux.tar.gz")
sha256sums=('23b3d927f9163496661a3e83b2cf29fb4991d14cb7a5ab3bf6126710630104b4')

package() {
    # application
    install -dm 755 "${pkgdir}/opt/${_pkgname}"
    cp -r * "${pkgdir}/opt/${_pkgname}"

    # executable
    install -dm 755 "${pkgdir}/usr/bin"
    ln -s "/opt/${_pkgname}/authenticator" "${pkgdir}/usr/bin/${_pkgname}"
}

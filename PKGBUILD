# Maintainer: Toni500 <tonino512@linuxmail.org>
pkgname="customfetch-gui-bin"
_pkgname="customfetch"
pkgver=1.0.0
pkgrel=1
pkgdesc="Highly customizable and fast system information fetch program (GUI app) (Binary files)"
arch=('x86_64' 'aarch64')
url="https://github.com/Toni500github/customfetch"
license=('BSD-3-Clause')
depends=('gtk3' 'gtkmm3' 'customfetch-common')
optdepends=(
        "ttf-liberation: Font to be used for GUI (recommended)"
        "wayland: Library for getting the Wayland compositor faster"
        "dconf: Alternative to the slow gsettings command"
        "libxfce4util: Query XFCE4 version faster"
)
conflicts=('customfetch-gui-git' 'customfetch-gui')
source=("${url}/releases/download/v${pkgver}/${_pkgname}-gui-v${pkgver}.tar.gz")
sha256sums=("7700a8c7b1ba66a0ce3a5d4b854031211594b44de86b7ed03710713fc8cbcf37")

package() {
    mkdir -p "${pkgdir}/usr/share" "${pkgdir}/usr/bin"
    mv "${srcdir}/usr/bin/customfetch-gui" "${pkgdir}/usr/bin/"
    mv "${srcdir}/usr/share/applications/" "${pkgdir}/usr/share/"
}

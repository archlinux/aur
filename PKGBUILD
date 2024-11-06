# Maintainer: Toni500 <tonino512@linuxmail.org>
pkgname="customfetch-gui-bin"
_pkgname="customfetch"
pkgver=0.10.2
pkgrel=1
pkgdesc="Highly customizable and fast system information fetch program (With GUI mode) (Binary files)"
arch=('x86_64' 'aarch64')
url="https://github.com/Toni500github/customfetch"
license=('BSD-3-Clause')
depends=('gtk3' 'gtkmm3')
optdepends=(
        "ttf-liberation: Font to be used for GUI (recommended)"
        "wayland-client: Library for getting the Wayland compositor faster"
        "dconf: Alternative to the slow gsettings command"
        "libxfce4util: Query XFCE4 version faster"
)
conflicts=('customfetch-gui-git' 'customfetch-gui' 'customfetch-git' 'customfetch-bin')
source=("${url}/releases/download/v${pkgver}/${_pkgname}-gui-v${pkgver}.tar.gz")
sha256sums=("37caf92c61cfd80c380ba08f9a4cb34de5c30ce08d560a484c93b2df1e32b9ae")

package() {
    cd "${srcdir}/"
    install -Dm755 "customfetch" "${pkgdir}/usr/bin/customfetch"
    install -Dm644 "customfetch.1" "${pkgdir}/usr/share/man/man1/customfetch.1"
    install -Dm644 "customfetch.desktop" "${pkgdir}/usr/share/applications/customfetch.desktop"
    install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
    cd assets/ && find ascii/ -type f -exec install -Dm 644 "{}" "${pkgdir}/usr/share/customfetch/{}" \;
}

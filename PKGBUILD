# Maintainer: Toni500 <tonino512@linuxmail.org>
pkgname="customfetch-gui-bin"
_pkgname="customfetch"
pkgver=0.10.1
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
sha256sums=("cb8f9f7e011a85e87eb46d0b8bb31c3535e3e0e84e6a67b23c54e725fe96b580")

package() {
    cd "${srcdir}/"
    install -Dm755 "cufetch" "${pkgdir}/usr/bin/cufetch"
    install -Dm644 "cufetch.1" "${pkgdir}/usr/share/man/man1/cufetch.1"
    install -Dm644 "cufetch.desktop" "${pkgdir}/usr/share/applications/cufetch.desktop"
    install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
    cd assets/ && find ascii/ -type f -exec install -Dm 644 "{}" "${pkgdir}/usr/share/customfetch/{}" \;
}

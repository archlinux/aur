# Maintainer: Ghostdehole <dihenggan@outlook.com>

pkgname='gui.for.singbox-bin'
_pkgname='GUI.for.SingBox'
pkgver='1.26.1'
pkgrel=1
pkgdesc='GUI for SingBox (Desktop optimized with user-space data isolation)'
arch=('x86_64')
url="https://github.com/GUI-for-Cores/${_pkgname}"
license=('GPL-3.0-or-later')
depends=('glibc' 'glib2' 'gtk3' 'gdk-pixbuf2' 'webkit2gtk-4.1' 'hicolor-icon-theme' 'sing-box')
optdepends=('xdg-desktop-portal-gtk: For GTK portal theme detection'
            'dconf: Configuration system for reading theme state')
provides=('gui.for.singbox' 'gui-for-singbox')
conflicts=('gui.for.singbox' 'gui-for-singbox' 'gui-for-singbox-bin')

install="gui.for.singbox-bin.install"

source=("https://github.com/GUI-for-Cores/${_pkgname}/releases/download/v${pkgver}/${_pkgname}-linux-amd64.zip"
        "https://raw.githubusercontent.com/GUI-for-Cores/${_pkgname}/v${pkgver}/build/appicon.png"
        "gui-for-singbox.sh"
        "gui-for-singbox.desktop"
        "gui-for-singbox-cap.hook")

sha256sums=('4413dae481af1500e9576f61a14e9434aa42a8a1708a433b5a377dceaa3b7486'
            '08257d0d21c76a56e48e38105460927293a452ddc6b0b62db401bf5b5b9b7adf'
            'f261006fe1da5969b7afb22e76889ceb0ea6435a1cd3d0f68c0e6bc921f9e7ab'
            'fea47ff434d0dcb92973181e8b8db93c1e3339db1cf7f3db44c7e81e6e1ccf53'
            'ae0754a61b396da843ea6dc4738f4d5e3f8b423e8ffec66e5265a5c1f4286004')

package() {
    install -Dm755 "${srcdir}/${_pkgname}" -t "${pkgdir}/usr/lib/gui-for-singbox/"
    install -Dm755 "${srcdir}/gui-for-singbox.sh" "${pkgdir}/usr/bin/gui-for-singbox"
    install -Dm644 "${srcdir}/appicon.png" "${pkgdir}/usr/share/icons/hicolor/512x512/apps/gui-for-singbox.png"
    install -Dm644 "${srcdir}/gui-for-singbox.desktop" -t "${pkgdir}/usr/share/applications/"
    install -Dm644 "${srcdir}/gui-for-singbox-cap.hook" -t "${pkgdir}/usr/share/libalpm/hooks/"
}

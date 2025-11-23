# Maintainer: Zeus-Deus
pkgname=hyprmode
pkgver=0.1.4
pkgrel=1
pkgdesc="Super+P style display mode switcher for Hyprland with auto Omarchy theming"
arch=('any')
url="https://github.com/Zeus-Deus/hyprmode"
license=('MIT')
depends=('python-textual' 'hyprland' 'alacritty')
optdepends=('python-tomli: Optional for Python < 3.11 for Omarchy theming support')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/Zeus-Deus/hyprmode/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('a49a813b63ea063b6b340e9059fffac40fa90a4236fa9e658985f4cc7b405a43')

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    install -Dm755 hyprmode.py "${pkgdir}/usr/bin/hyprmode"
    install -Dm755 hyprmode-daemon.py "${pkgdir}/usr/bin/hyprmode-daemon"
    install -Dm755 hyprmode-daemon-wrapper "${pkgdir}/usr/bin/hyprmode-daemon-wrapper"
    install -Dm644 hyprmode-daemon.service "${pkgdir}/usr/lib/systemd/user/hyprmode-daemon.service"
    install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}


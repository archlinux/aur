# Maintainer: Zeus-Deus
pkgname=hyprmode
pkgver=0.1.2
pkgrel=1
pkgdesc="Super+P style display mode switcher for Hyprland with auto Omarchy theming"
arch=('any')
url="https://github.com/Zeus-Deus/hyprmode"
license=('MIT')
depends=('python-textual' 'hyprland' 'alacritty')
optdepends=('python-tomli: Optional for Python < 3.11 for Omarchy theming support')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/Zeus-Deus/hyprmode/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('4b42aa3bd797763d008c5c18515d020556af4b5429214f53b102d41938bf16af')

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    install -Dm755 hyprmode.py "${pkgdir}/usr/bin/hyprmode"
    install -Dm755 hyprmode-daemon.py "${pkgdir}/usr/bin/hyprmode-daemon"
    install -Dm755 hyprmode-daemon-wrapper "${pkgdir}/usr/bin/hyprmode-daemon-wrapper"
    install -Dm644 hyprmode-daemon.service "${pkgdir}/usr/lib/systemd/user/hyprmode-daemon.service"
    install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}


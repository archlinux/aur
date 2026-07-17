# Maintainer: ZauJulio <zaujulio.dev@gmail.com>
pkgname=hyprselect-bin
pkgver=0.2.0
pkgrel=1
pkgdesc="Lightweight TUI screen share picker for Hyprland"
arch=('x86_64' 'aarch64')
url="https://github.com/ZauJulio/hyprselect"
license=('MIT')
depends=('slurp')
optdepends=('ghostty: default terminal for the picker wrapper'
            'kitty: alternative terminal for the picker wrapper'
            'foot: alternative terminal for the picker wrapper'
            'alacritty: alternative terminal for the picker wrapper')
provides=('hyprselect')
conflicts=('hyprselect')
install=hyprselect.install

_base_url="${url}/releases/download/v${pkgver}"
source_x86_64=("${_base_url}/hyprselect-${pkgver}-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("${_base_url}/hyprselect-${pkgver}-aarch64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('SKIP')
sha256sums_aarch64=('SKIP')

package() {
    install -Dm755 hyprselect "${pkgdir}/usr/bin/hyprselect"
    install -Dm755 hyprselect-picker "${pkgdir}/usr/bin/hyprselect-picker"
    install -Dm644 share/hyprselect/xdph.conf "${pkgdir}/usr/share/hyprselect/xdph.conf"
    install -Dm644 share/hyprselect/portals.conf "${pkgdir}/usr/share/hyprselect/portals.conf"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

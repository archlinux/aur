# Maintainer: ZauJulio <zaujulio.dev@gmail.com>
pkgname=hyprselect-bin
pkgver=0.3.0
pkgrel=1
pkgdesc="Lightweight TUI screen share picker for Hyprland"
arch=('x86_64' 'aarch64')
url="https://github.com/ZauJulio/hyprselect"
license=('MIT')
depends=('slurp')
optdepends=('ghostty: terminal for the picker UI'
            'kitty: terminal for the picker UI'
            'foot: terminal for the picker UI'
            'alacritty: terminal for the picker UI')
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
    install -Dm644 share/hyprselect/xdph.conf "${pkgdir}/usr/share/hyprselect/xdph.conf"
    install -Dm644 share/hyprselect/portals.conf "${pkgdir}/usr/share/hyprselect/portals.conf"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

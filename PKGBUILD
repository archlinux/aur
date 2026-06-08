# Maintainer: Nirvam <marvinbeeblebrox at gmail dot com>

pkgname=ashell-bin
pkgver=0.9.0
pkgrel=1
pkgdesc="A ready to go Wayland status bar for Hyprland and Niri"
url="https://github.com/MalpenZibo/ashell"
license=("GPL-3.0-or-later")
provides=("ashell")
conflicts=("ashell" "ashell-git")
depends=(
    "libxkbcommon"
    "wayland"
    "dbus"
    "libpipewire"
    "libpulse"
)
optdepends=(
    "hyprland"
    "niri"
)
arch=("x86_64")
install="${pkgname}.install"
options=(!strip)
source=(
    "ashell-${pkgver}.tar.xz::${url}/releases/download/${pkgver}/ashell-x86_64-unknown-linux-gnu.tar.xz"
    "ashell.service"
)
sha512sums=('c99a879fcaa2d45e3ff2eaffe229b0479b2dd6310a30117469ab4e35dc624ddce404763ba0164a6d6cb660573c3c06eb4736a21fcf12d38dcc670d403fae2e77'
    'dd4488aeef3bc08a82882dd69c2b470c407fa7440abb86ed79e883cc8a5e8621292861d221ee42b2ca130ecc0155660663ce41faacbf5576bbbe986189cb6287')

package() {
    _output="${srcdir}/ashell-x86_64-unknown-linux-gnu"
    install -Dm0755 "${_output}/ashell" "${pkgdir}/usr/bin/ashell"
    install -Dm0644 "${_output}/LICENSE" "${pkgdir}/usr/share/licenses/ashell/LICENSE"
    install -Dm0644 "${_output}/README.md" "${pkgdir}/usr/share/doc/ashell/README.md"
    install -Dm0644 "${srcdir}/ashell.service" "${pkgdir}/usr/lib/systemd/user/ashell.service"
}

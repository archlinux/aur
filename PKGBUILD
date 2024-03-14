# Maintainer: Maximilian Luz <luzmaximilian@gmail.com>

_pkgname='surface-control'
pkgname="${_pkgname}-bin"
pkgver=0.4.6
pkgrel=3
_pkgrel=3
pkgdesc='Control various aspects of Microsoft Surface devices from the Command-Line'
url='https://github.com/linux-surface/surface-control'
license=('MIT')
arch=('x86_64')
depends=('gcc-libs' 'systemd-libs')


provides=("${_pkgname}")
conflicts=("${_pkgname}")

source=(
    "https://github.com/linux-surface/surface-control/releases/download/v${pkgver}-${_pkgrel}/surface-control-${pkgver}.${_pkgrel}-${CARCH}.bin.tar.xz"
)

sha256sums=('76b2b368480e8e230a0d8802a43e5ae6e2ca64b2f9a84416d14a874039e6dbb1')


package() {
    install -D -m755 "bin/surface" "$pkgdir/usr/bin/surface"

    # completion files
    install -D -m644 "shell-completions/surface.bash" "$pkgdir/usr/share/bash-completion/completions/surface"
    install -D -m644 "shell-completions/surface.zsh"  "$pkgdir/usr/share/zsh/site-functions/_surface"
    install -D -m644 "shell-completions/surface.fish" "$pkgdir/usr/share/fish/vendor_completions.d/surface.fish"

    # license
    install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/surface-control/LICENSE"
}

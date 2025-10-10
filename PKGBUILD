# Maintainer: Maximilian Luz <luzmaximilian@gmail.com>

_pkgname='surface-control'
pkgname="${_pkgname}-bin"
pkgver=0.4.9
pkgrel=1
_pkgrel=1
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

sha256sums=('4e0af1b21f3b7ebc2c35fcb4f9c7c2c254e4737b9a4e89092f6c298b7f4498db')


package() {
    install -D -m755 "bin/surface" "$pkgdir/usr/bin/surface"

    # completion files
    install -D -m644 "shell-completions/surface.bash" "$pkgdir/usr/share/bash-completion/completions/surface"
    install -D -m644 "shell-completions/surface.zsh"  "$pkgdir/usr/share/zsh/site-functions/_surface"
    install -D -m644 "shell-completions/surface.fish" "$pkgdir/usr/share/fish/vendor_completions.d/surface.fish"

    # license
    install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/surface-control/LICENSE"
}

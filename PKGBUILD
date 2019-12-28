# Maintainer: Maximilian Luz <luzmaximilian@gmail.com>

_pkgname='surface-control'
pkgname="${_pkgname}-bin"
pkgver=0.2.5
pkgrel=2
pkgdesc='Control various aspects of Microsoft Surface devices from the Command-Line'
url='https://github.com/linux-surface/surface-control'
license=('MIT')
arch=('x86_64')
depends=('gcc-libs')

provides=("${_pkgname}")
conflicts=("${_pkgname}")

source=(
    "https://github.com/linux-surface/surface-control/releases/download/v${pkgver}/surface-control-${pkgver}-${CARCH}.bin.tar.xz"
)

sha256sums=('3354767be9fa5c4d5da04df6dc76fb378f40fe0eb0e5b91be5ed9f17dc451968')


package() {
    install -D -m755 "bin/surface" "$pkgdir/usr/bin/surface"

    # completion files
    install -D -m644 "shell-completions/surface.bash" "$pkgdir/usr/share/bash-completion/completions/surface"
    install -D -m644 "shell-completions/surface.zsh"  "$pkgdir/usr/share/zsh/site-functions/_surface"
    install -D -m644 "shell-completions/surface.fish" "$pkgdir/usr/share/fish/completions/surface.fish"

    # license
    install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/surface-control/LICENSE"
}

# Maintainer: kamisaki
# Description: 💫 Terminalden Türkçe anime izleme aracı
pkgname=anitr-cli
pkgver=4.3.0
pkgrel=1
pkgdesc="💫 Terminalden Türkçe anime izleme aracı"
arch=('x86_64')
url="https://github.com/xeyossr/anitr-cli"
license=('GPL3')
depends=('mpv')
makedepends=('go' 'git')

optdepends=(
    'rofi: for --rofi mode (recommended for X11 users)'
    'rofi-wayland: for --rofi mode (recommended for Wayland users)'
)

provides=("${pkgname}")
conflicts=("${pkgname}")
source=(
    "git+https://github.com/xeyossr/anitr-cli.git#tag=v${pkgver}"
)
sha256sums=('SKIP')

build() {
    cd "$srcdir/${pkgname}"
    go mod tidy
    go build -o anitr-cli
}

package() {
    cd "$srcdir/${pkgname}"
    install -Dm755 "${srcdir}/${pkgname}/anitr-cli" "${pkgdir}/usr/bin/${pkgname}"
}

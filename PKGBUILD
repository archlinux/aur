# Maintainer: kamisaki
# Description: 🚀 Terminalde Türkçe altyazılı anime izleme ve arama aracı
pkgname=anitr-cli
pkgver=4.3.1
pkgrel=1
pkgdesc="🚀 Terminalde Türkçe altyazılı anime izleme ve arama aracı"
arch=('x86_64' 'armv7h' 'aarch64' 'i686')
url="https://github.com/xeyossr/anitr-cli"
license=('GPL3')
depends=('mpv')
makedepends=('go' 'git')

optdepends=(
    'rofi: for rofi ui (X11 users)'
    'rofi-wayland: for rofi ui (recommended for Wayland users)'
)

source=(
    "git+https://github.com/xeyossr/anitr-cli.git#tag=v${pkgver}"
)
sha256sums=('SKIP')

build() {
    cd "$srcdir/${pkgname}"
    go build -ldflags "-X github.com/xeyossr/anitr-cli/internal/update.CurrentVersion=v${pkgver}" -o anitr-cli
}

package() {
    cd "$srcdir/${pkgname}"
    install -Dm755 anitr-cli "${pkgdir}/usr/bin/${pkgname}"
}
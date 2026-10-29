# Maintainer: novica <nnovica@gmail.com>

pkgname=emaki-bin
pkgver=0.4.2 # renovate: datasource=github-releases depName=alkaline-software/emaki
pkgrel=1
pkgdesc="An agentic development environment"
arch=('x86_64' 'aarch64')
url="https://github.com/alkaline-software/emaki"
license=('MIT')
depends=(
    glibc
    libgcc
    libxcb
    libxkbcommon
    libxkbcommon-x11
    fontconfig
    freetype2
    wayland
    vulkan-icd-loader
    hicolor-icon-theme
)
optdepends=('xdg-desktop-portal: file picker and secret storage')
provides=("emaki=${pkgver}")
conflicts=('emaki')
options=('!debug' '!strip')
source=("LICENSE-${pkgver}::https://raw.githubusercontent.com/alkaline-software/emaki/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.deb::${url}/releases/download/v${pkgver}/Emaki-linux-x64.deb")
source_aarch64=("${pkgname}-${pkgver}-aarch64.deb::${url}/releases/download/v${pkgver}/Emaki-linux-arm64.deb")

package() {
    bsdtar -xf data.tar.gz -C "$pkgdir"
    install -Dm644 "LICENSE-${pkgver}" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

sha256sums=('7c7aa1f981bbd6e9285dc04212226c84ea31caec4e01fbce6ebcc9f035d95324')
sha256sums_x86_64=('351a5549a46de79fc4b228e0f5421754db0b01de1c7033fbdc932e8e36ef96f8')
sha256sums_aarch64=('150d9cd408b43a632a969e95259971c3b0bcce8957a0df38f947082fdc127bd0')

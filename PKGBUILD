# Maintainer: novica <nnovica@gmail.com>

pkgname=emaki-bin
pkgver=0.3.2 # renovate: datasource=github-releases depName=alkaline-software/emaki
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
sha256sums_x86_64=('99bf15a9c5e9f21345048243202383142248024c4ecd238d9c5d43a9da7bf772')
sha256sums_aarch64=('a63c68af1f4d5e5c5908703d41233e736ac947326ee066440763db696f87a779')

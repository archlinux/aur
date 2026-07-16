# Maintainer: zlicdt <xkicdt1@gmail.com>

pkgname=open-orpheus
pkgver=0.16.0
pkgrel=1
pkgdesc="An open-source implementation of Netease Cloud Music's Orpheus browser host."
arch=('x86_64')
url="https://github.com/YUCLing/open-orpheus"
license=('MIT')
arch=('x86_64')
depends=(
    'gtk3'
    'libnotify'
    'nss'
    'xdg-utils'
    'at-spi2-core'
    'libdrm'
    'mesa'
    'libxcb'
)
optdepends=('kde-cli-tools')
makedepends=('libarchive')
source=(
    "${pkgname}_${pkgver}_amd64.deb::https://github.com/YUCLing/open-orpheus/releases/download/v${pkgver}/${pkgname}_${pkgver}_amd64.deb"
    "LICENSE"
)
sha256sums=(
    'bdcb4559b1f1488ec9ba4dfd4cf15a1b41b1bc3abb26963cf9f828650f037ffd'
    '4499595d653b7a9e65001bb09239e6fb5d33e650d1f9db808ce87905021e9ff8'
)

prepare() {
    ar x ${pkgname}_${pkgver}_amd64.deb
}

# Thank for wustdsh's suggestion
package() {
    bsdtar -xf data.tar.zst -C ${pkgdir} --no-same-owner
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/%{pkgname}/LICENSE"
}

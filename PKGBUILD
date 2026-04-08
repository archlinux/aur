# Maintainer: zlicdt <xkicdt1@gmail.com>

pkgname=open-orpheus
pkgver=0.2.0
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
    'kde-cli-tools'
)
makedepends=('libarchive')
source=("${pkgname}_${pkgver}_amd64.deb::https://github.com/YUCLing/open-orpheus/releases/download/v${pkgver}/${pkgname}_${pkgver}_amd64.deb")
sha256sums=('5cd70e457af977002d5bc76cd5148820818b7cad7a3448095035717353d5f3d5')

prepare() {
    ar x ${pkgname}_${pkgver}_amd64.deb
}

package() {
    cd ${srcdir}
    bsdtar -xf data.tar.zst -C ${pkgdir} --no-same-owner
    install -Dm644 ../LICENSE "${pkgdir}/usr/share/licenses/%{pkgname}/LICENSE"
}

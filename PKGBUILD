# Maintainer: zlicdt <xkicdt1@gmail.com>

pkgname=open-orpheus
pkgver=0.5.5
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
sha256sums=('51ac52442a268735b3afae7c5fa49bad4dbe2c19a4f4db40105bca1b18658e8f')

prepare() {
    ar x ${pkgname}_${pkgver}_amd64.deb
}

package() {
    cd ${srcdir}
    bsdtar -xf data.tar.zst -C ${pkgdir} --no-same-owner
    install -Dm644 ../LICENSE "${pkgdir}/usr/share/licenses/%{pkgname}/LICENSE"
}

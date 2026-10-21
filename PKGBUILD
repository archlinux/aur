# Maintainer: Dmitriy Geels <dmitry.geels@gmail.com>

pkgname=adcode-bin
pkgver=2.4.0
pkgrel=1
pkgdesc="An ad-supported, AI-native IDE"
arch=('x86_64')
url="https://github.com/bluethenics/adcode"
license=('Apache-2.0')

depends=(
    'gtk3'
    'libnotify'
    'nss'
    'libxss'
    'libxtst'
    'at-spi2-core'
    'util-linux-libs'
    'libsecret'
    'xdg-utils'
)
optdepends=(
    'libappindicator: system tray integration'
)
provides=('adcode')
conflicts=('adcode')

source=(
    "${pkgname}-${pkgver}.deb::${url}/releases/download/v${pkgver}/ADCode-amd64.deb"
)
sha256sums=('094299af1ac273d5266bef35b087124ce8f023426e2600c11d0a0bb1f0c15b31')

noextract=("${pkgname}-${pkgver}.deb")

package() {
    bsdtar -xOf "${srcdir}/${pkgname}-${pkgver}.deb" data.tar.xz |
        bsdtar -xf - -C "${pkgdir}"
}

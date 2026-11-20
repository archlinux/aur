# Maintainer: Dmitriy Geels <dmitry.geels@gmail.com>

pkgname=adcode-bin
pkgver=2.6.2
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
sha256sums=('9c4bf4717d8edbfd26092c4d9a2356dba3d400e6b346c6348381b16cf887d625')

noextract=("${pkgname}-${pkgver}.deb")

package() {
    bsdtar -xOf "${srcdir}/${pkgname}-${pkgver}.deb" data.tar.xz |
        bsdtar -xf - -C "${pkgdir}"
}

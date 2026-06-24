# Maintainer: dvytvs

pkgname=paint-bin
pkgver=1.2.0
pkgrel=1
pkgdesc="A simple paint application for Linux"
arch=('x86_64')
url="https://github.com/dvytvs/Paint-linux"
license=('GPL3')

depends=(
    'gtk3'
    'nss'
    'libxss'
    'alsa-lib'
)

provides=('paint')
conflicts=('paint')

source=(
    "paint-${pkgver}.pacman::https://github.com/dvytvs/Paint-linux/releases/download/${pkgver}/paint-${pkgver}.pacman"
)

sha256sums=('SKIP')

package() {
    bsdtar -xf "${srcdir}/paint-${pkgver}.pacman" -C "${pkgdir}"

    rm -f "${pkgdir}/.INSTALL"
    rm -f "${pkgdir}/.MTREE"
    rm -f "${pkgdir}/.PKGINFO"
}

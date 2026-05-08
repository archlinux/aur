# Maintainer: dvytvs

pkgname=glass-music-bin
pkgver=2.0.4
pkgrel=1
pkgdesc="Futuristic liquid-glass music player for Linux"
arch=('x86_64')
url="https://github.com/dvytvs/Glass-Music"
license=('MIT')

depends=(
    'gtk3'
    'nss'
    'libxss'
    'alsa-lib'
)

provides=('glass-music')
conflicts=('glass-music')

source=(
    "glass-music-${pkgver}.pacman::https://github.com/dvytvs/Glass-Music/releases/download/${pkgver}/glass-music-${pkgver}.pacman"
)

sha256sums=('SKIP')

package() {
    bsdtar -xf "${srcdir}/glass-music-${pkgver}.pacman" -C "${pkgdir}"

    rm -f "${pkgdir}/.INSTALL"
    rm -f "${pkgdir}/.MTREE"
    rm -f "${pkgdir}/.PKGINFO"
}

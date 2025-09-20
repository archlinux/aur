# Maintainer: MuyeSlock <MuyeSlock at 163 dot com>
# Updated for native pacman package support

_pkgname=splayer
pkgname=splayer
pkgver=3.0.0_beta.2
pkgrel=1
pkgdesc="Splayer | A minimalist music player"
arch=('x86_64')
url="https://github.com/imsyy/SPlayer"
license=("AGPL-3.0-only")
provides=("${_pkgname}=${pkgver}")
conflicts=("${_pkgname}")
depends=()
options=(!strip !debug)

source=("https://github.com/imsyy/SPlayer/releases/download/v${pkgver//_/-}/splayer-${pkgver//_/-}.pacman")
sha256sums=('d6d0983ac32acf239c7b092debc14476eafe5a93706270525f0017cc2452ea4c')

noextract=("${source[0]##*/}")

package() {
    msg2 "Extracting native pacman package..."
    bsdtar -x -f "${srcdir}/${source[0]##*/}" -C "$pkgdir" --exclude .PKGINFO --exclude .MTREE --exclude .INSTALL
}
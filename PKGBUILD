# Maintainer: truelockmc <anonyson@proton.me>
pkgname=streambert-bin
pkgver=2.5.0
pkgrel=1
pkgdesc="Cross-platform Desktop App to stream and download Movies, TV Series and Anime"
arch=('x86_64')
url="https://github.com/truelockmc/streambert"
license=('GPL3')
depends=('ffmpeg')
provides=('streambert')
conflicts=('streambert')
source_x86_64=("https://github.com/truelockmc/streambert/releases/download/${pkgver}/streambert-${pkgver}.pacman")
sha256sums_x86_64=('bfe2e53697644859c8af30d842da33842c1af6b12c08dc5c5de6cadef84b2d23')

package() {
    bsdtar -xf "${srcdir}/streambert-${pkgver}.pacman" -C "${pkgdir}/" \
        --exclude='.INSTALL' \
        --exclude='.MTREE' \
        --exclude='.PKGINFO'

    # Make it work in Terminal
    mkdir -p "${pkgdir}/usr/bin"
    ln -s "/opt/Streambert/streambert" "${pkgdir}/usr/bin/streambert"
}

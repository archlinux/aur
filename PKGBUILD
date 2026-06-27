# Maintainer: truelockmc <anonyson@proton.me>
pkgname=streambert-bin
pkgver=2.6.0
pkgrel=1
pkgdesc="Cross-platform Desktop App to stream and download Movies, TV Series and Anime"
arch=('x86_64')
url="https://github.com/truelockmc/streambert"
license=('GPL3')
depends=('ffmpeg')
provides=('streambert')
conflicts=('streambert')
source_x86_64=("https://github.com/truelockmc/streambert/releases/download/${pkgver}/streambert-${pkgver}.pacman")
sha256sums_x86_64=('1c7ff906ae3a35a185834d09d510804ec883f4622f10d9f3395b0d1b37697372') # Note to self: remember to always update that

package() {
    bsdtar -xf "${srcdir}/streambert-${pkgver}.pacman" -C "${pkgdir}/" \
        --exclude='.INSTALL' \
        --exclude='.MTREE' \
        --exclude='.PKGINFO'

    # Make it work in Terminal
    mkdir -p "${pkgdir}/usr/bin"
    ln -s "/opt/Streambert/streambert" "${pkgdir}/usr/bin/streambert"
}

# run makepkg --printsrcinfo > .SRCINFO

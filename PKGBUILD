# Maintainer:  nemesys nemstar zoho.com
# Contributor: Mariusz Libera <mariusz.libera@gmail.com>
# Contributor: Kevin Piche <kevin@archlinux.org>
# Contributor: K. Piche <kpiche@rogers.com>
# Contributor: Artiom Molchanov ar.molchanov gmail.com
pkgname=einstein
_gitname=einstein-puzzle
pkgver=2.0
pkgrel=6
pkgdesc="Remake of old DOS game Sherlock which was inspired by Albert Einstein's puzzle"
#original="http://web.archive.org/web/20120521062745/http://games.flowix.com/en/index.html"
url="https://github.com/lksj/einstein-puzzle"
arch=('i686' 'x86_64')
license=('GPL')
depends=('sdl_ttf' 'sdl_mixer' 'xorg-server')
makedepends=('git' 'ttf-dejavu')
checkdepends=('sharutils')
changelog=ChangeLog
source=("git+https://github.com/lksj/einstein-puzzle.git"
        "${pkgname}.desktop"
        "${pkgname}.png")
md5sums=('SKIP'
         '4da7f4b1b17f7385ef2cb14fc6326997'
         '81b58f2e3c61c0b50716992a30f2d4cc')

build() {
    cd "${srcdir}/einstein-puzzle"
    make PREFIX=/usr
}

package() {
    cd "${srcdir}/einstein-puzzle"
    make PREFIX="${pkgdir}/usr" install

    install -Dm 644 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
    install -Dm 644 "${srcdir}/${pkgname}.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
}


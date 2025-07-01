# Maintainer: envolution
# Contributor:  nemesys nemstar zoho.com
# Contributor: Mariusz Libera <mariusz.libera@gmail.com>
# Contributor: Kevin Piche <kevin@archlinux.org>
# Contributor: K. Piche <kpiche@rogers.com>
# Contributor: Artiom Molchanov ar.molchanov gmail.com
# shellcheck shell=bash disable=SC2034,SC2154
pkgname=einstein
_gitname=einstein-puzzle
pkgver=2.2
pkgrel=1
pkgdesc="Remake of old DOS game Sherlock which was inspired by Albert Einstein's puzzle"
#original="http://web.archive.org/web/20120521062745/http://games.flowix.com/en/index.html"
# old fork url="https://github.com/lksj/einstein-puzzle"
url="https://github.com/jordan-evens/einstein-puzzle"
arch=('i686' 'x86_64')
license=('GPL-2.0-only')
depends=('sdl_ttf' 'glibc' 'zlib' 'sdl12-compat' 'sdl_mixer' 'freetype2')
makedepends=('git')
_commit='0b7a6c7896dd431cedd54ba696a190b8919f4bc3'
source=("git+https://github.com/jordan-evens/einstein-puzzle.git#commit=${_commit}"
        "${pkgname}.desktop"
        "${pkgname}.png")
md5sums=('6cf2e0d66362700e295327a101b4cfff'
         'f9a54dfbf5650414808af28003666b9b'
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

# vim:set ts=2 sw=2 et:

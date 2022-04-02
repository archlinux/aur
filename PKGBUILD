# Maintainer: Lawrence González <pentestian [at] airmail [dot] cc>
# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=lzdoom-bin
pkgver=3.88.b
_pkgver=3.88b
pkgrel=1
pkgdesc='Advanced Doom source port with OpenGL support (binary legacy version)'
arch=('i686' 'x86_64')
url='https://www.zdoom.org/'
license=('GPL3')
conflicts=('lzdoom')
depends=('sdl2' 'alsa-lib')
optdepends=('fluidsynth'
            'libsndfile'
            'mpg123'
            'openal'
            'timidity++'
            'blasphemer-wad: Blasphemer (free Heretic) game data'
            'chexquest3-wad: Chex Quest 3 game data'
            'doom1-wad: Doom shareware game data'
            'freedm: FreeDM game data'
            'freedoom1: Freedoom: Phase 1 game data'
            'freedoom2: Freedoom: Phase 2 game data'
            'hacx-wad: HacX game data'
            'harmony-wad: Harmony game data'
            'heretic1-wad: Heretic shareware game data'
            'hexen1-wad: Hexen demo game data'
            'strife0-wad: Strife shareware game data'
            'square1-wad: The Adventures of Square, Episode 1 game data'
            'urbanbrawl-wad: Urban Brawl: Action Doom 2 game data')
options=('!strip' '!emptydirs')
source_i686=("https://github.com/drfrag666/gzdoom/releases/download/${_pkgver}/lzdoom_${_pkgver}_i386.deb")
source_x86_64=("https://github.com/drfrag666/gzdoom/releases/download/${_pkgver}/lzdoom_${_pkgver}_amd64.deb")
sha256sums_i686=('1236c28f416e09367127715d67a0d45bf187a851bc1327b5a29460d17aeb0565')
sha256sums_x86_64=('78a79f88ade1bca7ffa146b28304077ab18200c898cd79c3c7c3b142bc8a7ede')

package() {
    tar xf data.tar.xz -C "${pkgdir}"
    cd "${pkgdir}"
    mkdir usr/bin
    mv usr/games/* usr/bin
    rm -rf usr/games
}

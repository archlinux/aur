# Maintainer: Svitozar Cherepii <razotivs@gmail.com>
pkgname=rvgl-tracks
pkgver=19.0414
pkgrel=1
pkgdesc="Additional RVGL tracks for official events."
url='https://rvgl.re-volt.io'
arch=('any')
license=('custom')
depends=('rvgl-bin')
optdepends=('rvgl-loadlevel: custom load screens'
            'rvgl-music: music for levels')
source=("https://distribute.re-volt.io/packs/io_tracks.zip"
        "https://distribute.re-volt.io/releases/io_tracks.txt")
sha256sums=('9fc6021d2d306256777f91ec65d4e91ae22a98dce66a7679b0c475c2f2eb3bcf'
            'SKIP')

pkgver() {
    cat io_tracks.txt
}

package() {
    # remove conflicting file from moved bonus track
    rm gfx/playoutside.bmp

    find gfx levels -type f -exec \
        install -Dm644 {} "$pkgdir/opt/rvgl/{}" \;
}

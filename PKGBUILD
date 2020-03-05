# Maintainer: Svitozar Cherepii <razotivs@gmail.com>
pkgname=rvgl-tracks
pkgver=20.0302
pkgrel=1
pkgdesc="Additional RVGL tracks for official events."
url='https://rvgl.re-volt.io'
arch=('any')
license=('custom')
depends=('rvgl-bin')
optdepends=('rvgl-loadlevel: custom load screens'
            'rvgl-music: music for levels')
source=("$pkgname-$pkgver.zip::https://distribute.re-volt.io/packs/io_tracks.zip")
sha256sums=('d359faf8e5b82848f9d3d6458e44410b249dfcf130d7f6b6082b789c77a2a441')

package() {
    # remove conflicting file from moved bonus track
    rm gfx/playoutside.bmp

    find gfx levels -type f -exec \
        install -Dm644 {} "$pkgdir/opt/rvgl/{}" \;
}

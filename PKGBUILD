# Maintainer: Svitozar Cherepii <razotivs@gmail.com>
pkgname=rvgl-tracks
pkgver=19.0630
pkgrel=1
pkgdesc="Additional RVGL tracks for official events."
url='https://rvgl.re-volt.io'
arch=('any')
license=('custom')
depends=('rvgl-bin')
optdepends=('rvgl-loadlevel: custom load screens'
            'rvgl-music: music for levels')
source=("$pkgname-$pkgver.zip::https://distribute.re-volt.io/packs/io_tracks.zip")
sha256sums=('5aa5fa144df5b981964ba2489ba0dcb2b5785e54949952ee03acbe4a66db416f')

package() {
    # remove conflicting file from moved bonus track
    rm gfx/playoutside.bmp

    find gfx levels -type f -exec \
        install -Dm644 {} "$pkgdir/opt/rvgl/{}" \;
}

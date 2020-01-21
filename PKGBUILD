# Maintainer: Svitozar Cherepii <razotivs@gmail.com>
pkgname=rvgl-tracks
pkgver=20.0120
pkgrel=1
pkgdesc="Additional RVGL tracks for official events."
url='https://rvgl.re-volt.io'
arch=('any')
license=('custom')
depends=('rvgl-bin')
optdepends=('rvgl-loadlevel: custom load screens'
            'rvgl-music: music for levels')
source=("$pkgname-$pkgver.zip::https://distribute.re-volt.io/packs/io_tracks.zip")
sha256sums=('b321a8c0257ae1f6de0c5b962df0b19d6fb3baa81c35300813b807b1afef89f2')

package() {
    # remove conflicting file from moved bonus track
    rm gfx/playoutside.bmp

    find gfx levels -type f -exec \
        install -Dm644 {} "$pkgdir/opt/rvgl/{}" \;
}

# Maintainer: Svitozar Cherepii <razotivs@gmail.com>
pkgname=rvgl-tracks
pkgver=20.0413
pkgrel=1
pkgdesc="Additional RVGL tracks for official events."
url='https://rvgl.re-volt.io'
arch=('any')
license=('custom')
depends=('rvgl-bin')
optdepends=('rvgl-loadlevel: custom load screens'
            'rvgl-music: music for levels')
source=("$pkgname-$pkgver.zip::https://distribute.re-volt.io/packs/io_tracks.zip")
sha256sums=('441401a84ae7f7e8616389ad41e0aa14b7159dfbaeb07a4855ac645c358a5c22')

prepare() {
    # Remove conflicting file present in rvgl-tracks-bonus
    rm gfx/playoutside.bmp
}

package() {
    find gfx levels -type f -exec \
        install -Dm644 {} "$pkgdir/opt/rvgl/{}" \;
}

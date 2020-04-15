# Maintainer: Svitozar Cherepii <razotivs@gmail.com>
pkgname=rvgl-tracks-bonus
pkgver=20.0413
pkgrel=1
pkgdesc="Additional RVGL tracks no longer used for official events."
url='https://rvgl.re-volt.io'
arch=('any')
license=('custom')
depends=('rvgl-bin')
optdepends=('rvgl-loadlevel: custom load screens'
            'rvgl-music: music for levels')
source=("$pkgname-$pkgver.zip::https://distribute.re-volt.io/packs/io_tracks_bonus.zip")
sha256sums=('d313cfcb3e94e976917da80b296c57cdda96e9502f4fec55d3e6b2f3830d0ee0')

prepare() {
    # Remove conflicting files present in rvgl-tracks
    rm -r gfx/cake.bmp levels/cake
}

package() {
    find gfx levels -type f -exec \
        install -Dm644 {} "$pkgdir/opt/rvgl/{}" \;
}

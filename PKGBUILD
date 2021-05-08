# Maintainer: Huki <gk7huki@gmail.com>
# Contributor: Svitozar Cherepii <razotivs@gmail.com>

pkgname=rvgl-io-skins-bonus
pkgver=21.0308
pkgrel=2
pkgdesc="Additional skins for RVGL default and community cars."
url='https://re-volt.io/downloads/packs'
arch=('any')
license=('custom')
depends=('rvgl-bin')
optdepends=('rvgl-io-cars: additional cars for official events'
            'rvgl-io-cars-bonus: additional cars')
makedepends=('git')
groups=('rvgl-community')
source=("rvgl_io_skins_bonus"::git+https://gitlab.com/re-volt/rvio/bonus_skins.git#tag=${pkgver})
sha256sums=('SKIP')

package() {
    cd "$srcdir/rvgl_io_skins_bonus"

    # Remove conflicting files present in cars pack
    rm cars/kingmoloko/carwhite.bmp
    rm cars/sideswipe/carfatalsp.bmp
    rm cars/xm250/carcyborg.bmp
    rm cars/xm250/carcyborgtwo.bmp
    rm cars/xm250/cardron.bmp

    find * -type f -exec install -Dm644 {} "$pkgdir/opt/rvgl/{}" \;
}

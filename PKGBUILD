# Maintainer: Huki <gk7huki@gmail.com>
# Contributor: Svitozar Cherepii <razotivs@gmail.com>

pkgname=rvgl-io-skins-bonus
pkgver=25.0902
pkgrel=1
pkgdesc="Additional skins for RVGL default and community cars."
url='https://re-volt.io/online/cars'
arch=('any')
license=('custom')
depends=('rvgl-bin')
optdepends=('rvgl-io-cars: additional cars for official events'
            'rvgl-io-cars-bonus: additional cars')
makedepends=('git')
groups=('rvgl-bonus')
source=("rvgl_io_skins_bonus"::git+https://gitlab.com/re-volt/rvio/bonus_skins.git#tag=${pkgver})
sha256sums=('SKIP')

package() {
    cd "$srcdir/rvgl_io_skins_bonus"

    # Fix filenames
    mv cars/phat/carYECA.bmp cars/phat/caryeca.bmp
    mv cars/xm250/carzod.BMP cars/xm250/carzod.bmp

    find * -type f -exec install -Dm644 {} "$pkgdir/opt/rvgl/{}" \;
}

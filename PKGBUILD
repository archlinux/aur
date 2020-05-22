# Maintainer: Huki <gk7huki@gmail.com>
# Contributor: Svitozar Cherepii <razotivs@gmail.com>

pkgname=rvgl-io-cars-bonus
pkgver=20.0413
pkgrel=2
pkgdesc="Additional RVGL cars used for special events."
url='https://rvgl.re-volt.io'
arch=('any')
license=('custom')
depends=('rvgl-bin')
optdepends=('rvgl-io-skins: additional car skins')
makedepends=('git')
conflicts=('rvgl-cars-bonus')
replaces=('rvgl-cars-bonus')
groups=('rvgl-community')
source=("rvgl_io_cars_bonus"::git+https://gitlab.com/re-volt/rvio/bonus_cars.git#tag=${pkgver})
sha256sums=('SKIP')

package() {
    cd "$srcdir/rvgl_io_cars_bonus"

    # Remove conflicting files present in cars pack
    rm -r cars/minichamp2018

    find * -type f -exec install -Dm644 {} "$pkgdir/opt/rvgl/{}" \;
}

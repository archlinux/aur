# Maintainer: Huki <gk7huki@gmail.com>
# Contributor: Svitozar Cherepii <razotivs@gmail.com>

pkgname=rvgl-io-skins
pkgver=20.1018
pkgrel=2
pkgdesc="Additional skins for RVGL default and community cars."
url='https://re-volt.io/downloads/packs'
arch=('any')
license=('custom')
depends=('rvgl-bin')
optdepends=('rvgl-io-cars: additional cars for official events')
makedepends=('git')
conflicts=('rvgl-skins')
replaces=('rvgl-skins')
groups=('rvgl-community')
source=("rvgl_io_skins"::git+https://gitlab.com/re-volt/rvio/skins.git#tag=${pkgver})
sha256sums=('SKIP')

package() {
    cd "$srcdir/rvgl_io_skins"

    # Remove conflicting files present in cars pack
    rm cars/phim_stinger/carstealth.bmp
    rm cars/xm250/car3.bmp
    rm cars/xm250/car4.bmp
    rm cars/xm250/car55.bmp
    rm cars/xm250/car5alt.bmp
    rm cars/xm250/car6.bmp
    rm cars/xm250/car70.bmp
    rm cars/xm250/carfire.bmp
    rm cars/xm250/carmouse.bmp
    rm cars/xm250/carsubzero.bmp
    rm cars/xm250/cartorkse.bmp
    rm cars/xm250/carudox.bmp
    rm cars/xm250/carvanguard.bmp

    find * -type f -exec install -Dm644 {} "$pkgdir/opt/rvgl/{}" \;
}

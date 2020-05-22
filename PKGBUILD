# Maintainer: Huki <gk7huki@gmail.com>
# Contributor: Svitozar Cherepii <razotivs@gmail.com>

pkgname=rvgl-io-skins
pkgver=20.0503
pkgrel=1
pkgdesc="Additional skins for RVGL default and community cars."
url='https://rvgl.re-volt.io'
arch=('any')
license=('custom')
depends=('rvgl-bin')
optdepends=('rvgl-io-cars: additional cars for official events'
            'rvgl-io-cars-bonus: additional cars')
makedepends=('git')
conflicts=('rvgl-skins')
replaces=('rvgl-skins')
groups=('rvgl-community')
source=("rvgl_io_skins"::git+https://gitlab.com/re-volt/rvio/skins.git#tag=${pkgver})
sha256sums=('SKIP')

package() {
    cd "$srcdir/rvgl_io_skins"

    # Remove conflicting files present in cars pack
    rm cars/fd5vector/carlux.bmp cars/phim_sentaro/car-khronos.bmp cars/selsia/carcelicapp.bmp

    find * -type f -exec install -Dm644 {} "$pkgdir/opt/rvgl/{}" \;
}

# Maintainer: Svitozar Cherepii <razotivs@gmail.com>
pkgname=rvgl-cars
pkgver=19.0317
pkgrel=1
pkgdesc="Additional RVGL cars used for official events."
url='https://rvgl.re-volt.io'
arch=('any')
license=('custom')
depends=('rvgl-bin')
optdepends=('rvgl-skins: additional car skins')
source=("https://distribute.re-volt.io/packs/io_cars.zip"
        "https://distribute.re-volt.io/releases/io_cars.txt")
sha256sums=('c9545c1dc2a4ed2c2e0b93c73568132e2926f55f2163b8e60c57f3585abb7568'
            'SKIP')

pkgver() {
    cat io_cars.txt
}

package() {
    find cars -type f -exec \
        install -Dm644 {} "$pkgdir/opt/rvgl/{}" \;
}

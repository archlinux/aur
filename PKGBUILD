# Maintainer: Svitozar Cherepii <razotivs@gmail.com>
pkgname=rvgl-cars-bonus
pkgver=18.0916
pkgrel=1
pkgdesc="Additional RVGL cars not used for official events."
url='https://rvgl.re-volt.io'
arch=('any')
license=('custom')
depends=('rvgl-bin')
optdepends=('rvgl-skins: additional car skins')
source=("https://distribute.re-volt.io/packs/io_cars_bonus.zip"
        "https://distribute.re-volt.io/releases/io_cars_bonus.txt")
sha256sums=('f9b8eac81e7ff96123eb7fb5674f52ff17b3ae7bf1b164d8dc11c413121683e8'
            'SKIP')

pkgver() {
    cat io_cars_bonus.txt
}

package() {
    # Remove conflicting cars moved to superpros pack
    rm -r cars/fd_s7 cars/fd_s9

    find cars -type f -exec \
        install -Dm644 {} "$pkgdir/opt/rvgl/{}" \;
}

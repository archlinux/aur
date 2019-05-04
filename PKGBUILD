# Maintainer: Svitozar Cherepii <razotivs@gmail.com>
pkgname=rvgl-loadlevel
pkgver=18.0326
pkgrel=1
pkgdesc="Loading screens for RVGL custom tracks."
url='https://rvgl.re-volt.io'
arch=('any')
license=('custom')
depends=('rvgl-bin')
optdepends=('rvgl-tracks: actual tracks loadscreens are for'
            'rvgl-tracks-bonus: actual tracks loadscreens are for')
source=("https://distribute.re-volt.io/packs/io_loadlevel.zip"
        "https://distribute.re-volt.io/releases/io_loadlevel.txt")
sha256sums=('5bb4ffcc67ec6ae2905bcf5c8634829aa0cd213f2374c7c27da0927b76edf3fb'
            'SKIP')

pkgver() {
    cat io_loadlevel.txt
}

package() {
    # Remove conflicting files present in track pack
    rm -r levels/industry

    find levels -type f -exec \
        install -Dm644 {} "$pkgdir/opt/rvgl/{}" \;
}

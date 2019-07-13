# Maintainer: Svitozar Cherepii <razotivs@gmail.com>
pkgname=rvgl-skins
pkgver=19.0630
pkgrel=1
pkgdesc="Additional RVGL skins for default cars and more."
url='https://rvgl.re-volt.io'
arch=('any')
license=('custom')
depends=('rvgl-bin')
optdepends=('rvgl-cars: additional cars skins provided for'
            'rvgl-cars-bonus: additional cars skins provided for')
source=("https://distribute.re-volt.io/packs/io_skins.zip"
        "https://distribute.re-volt.io/releases/io_skins.txt")
sha256sums=('48c92208c51dcf7e6dbb0d351c0742a61440fec82b86306013dc6cc154af2488'
            'SKIP')

pkgver() {
    cat io_skins.txt
}

package() {
    find cars -type f -exec \
        install -Dm644 {} "$pkgdir/opt/rvgl/{}" \;
}

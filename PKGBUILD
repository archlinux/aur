# Maintainer: Svitozar Cherepii <razotivs@gmail.com>
pkgname=rvgl-skins
pkgver=19.0414
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
sha256sums=('87b80b7f873b5ccd7f391a49fd7bc95fd2eca0014a9648ef97a6ec3c18d198a2'
            'SKIP')

pkgver() {
    cat io_skins.txt
}

package() {
    find cars -type f -exec \
        install -Dm644 {} "$pkgdir/opt/rvgl/{}" \;
}

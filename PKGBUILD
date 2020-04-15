# Maintainer: Svitozar Cherepii <razotivs@gmail.com>
pkgname=rvgl-cars-bonus
pkgver=20.0413
pkgrel=1
pkgdesc="Additional RVGL cars no longer used for official events."
url='https://rvgl.re-volt.io'
arch=('any')
license=('custom')
depends=('rvgl-bin')
optdepends=('rvgl-skins: additional car skins')
source=("$pkgname-$pkgver.zip::https://distribute.re-volt.io/packs/io_cars_bonus.zip")
sha256sums=('e8a5f753f291d31180d4aab4cc1ffce446ca3929893f070a86739dc0847b7f99')

prepare() {
    # Remove conflicting files present in rvgl-cars
    rm -r cars/minichamp2018
}

package() {
    find cars -type f -exec \
        install -Dm644 {} "$pkgdir/opt/rvgl/{}" \;
}

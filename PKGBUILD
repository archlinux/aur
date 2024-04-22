# Maintainer: Evgenii Alekseev

pkgname=kiview
_pkgname=Kiview
pkgver=1.0.2
pkgrel=1
pkgdesc="Quick files preview for dolphin"
arch=('x86_64')
url="https://github.com/Nyre221/Kiview"
license=('GPL-3.0-only')
depends=('kcoreaddons' 'ki18n' 'kirigami' 'qt6-multimedia' 'qt6-webengine')
makedepends=('cmake' 'extra-cmake-modules')
source=("https://github.com/Nyre221/Kiview/archive/refs/tags/v${pkgver}.tar.gz")

build () {
    cmake -B build -S "$_pkgname-$pkgver"
    cmake --build build
}

package() {
    DESTDIR="$pkgdir" cmake --install build
}

sha256sums=('8135cd6b56b3b580fdd7ce223c78cf4be32033c44e3bca86a8d5c68389311956')

# Maintainer: FirstAirBender <noblechuk5[at]web[dot]de>
pkgname=gnome-c-utils
pkgver=3.38.0
pkgrel=1
pkgdesc="Utilities when programming for GNOME, for the C language."
arch=('any')
url="https://github.com/swilmet/gnome-c-utils"
license=('GPL3')
depends=('glib2')
makedepends=('meson')
optdepends=(
    'tepl: required for building extra tools. ex gcu-lineup-substitution'
    'gtk3: required for building extra tools. ex gcu-lineup-substitution'
    'gtksourceview3: required for building extra tools. ex gcu-lineup-substitution'
)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('d75336c3b65c6a55389d778b829c42e8b8a11a28222038bf75b83c7507565b97')

build() {
    cd "$pkgname-$pkgver"
    arch-meson . build
    meson compile -C build
}

package() {
    cd "$pkgname-$pkgver"
    DESTDIR="$pkgdir" meson install -C build
}

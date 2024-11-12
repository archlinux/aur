# Contributor: Your Name <ahoyiski@gmail.com>

pkgname=wayfire-firedecor-git
pkgver=1.95.68a701d
pkgrel=1
pkgdesc="An advanced window decoration plugin for the wayfire window manager."
arch=('any')
url="https://github.com/AhoyISki/wayfire-firedecor.git"
license=('MIT')
depends=('wayfire-git' 'librsvg' 'boost-libs')
makedepends=('git' 'meson' 'ninja' 'boost')
provides=('wayfire-firedecor')
conflicts=('wayfire-firedecor')
source=('git+https://github.com/AhoyISki/wayfire-firedecor.git')
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/wayfire-firedecor"
    printf "1.%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    arch-meson build ${pkgname%-git}
    ninja -C build
}

package() {
    DESTDIR="$pkgdir" ninja -C install
}

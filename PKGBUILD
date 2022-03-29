# Maintainer: Your Name <ahoyiski@gmail.com>
pkgname=wayfire-firedecor-git
pkgver=1.14.b4a4029
pkgrel=1
pkgdesc="An advanced window decoration plugin for the wayfire window manager."
arch=('any')
url="https://github.com/AhoyISki/wayfire-firedecor.git"
license=('MIT')
depends=('wayfire-git' 'librsvg' 'boost')
makedepends=('git' 'meson' 'ninja')
provides=('wayfire-firedecor-git' 'wayfire-firedecor')
source=('git+https://github.com/AhoyISki/wayfire-firedecor.git')
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/wayfire-firedecor"
    printf "1.%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$srcdir/wayfire-firedecor"
	meson build
	meson compile -C build
}

package() {
    cd "$srcdir/wayfire-firedecor"
	sudo meson install -C build
}

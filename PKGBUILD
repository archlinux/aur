# Maintainer: Your Name <ahoyiski@gmail.com>
pkgname=wayfire-firedecor-git
pkgver=1.14.b4a4029
pkgrel=1
pkgdesc="An advanced window decoration plugin for the wayfire window manager."
arch=('any')
url="https://github.com/AhoyISki/wayfire-firedecor"
license=('MIT')
depends=('wayfire-git')
makedepends=('git' 'meson' 'ninja')
provides=('wayfire-firedecor-git' 'wayfire-firedecor')
source=('git+https://github.com/WayfireWM/wayfire')
sha256sums=('SKIP')

pkgver() {
    cd "$pkgname"
    printf "1.%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$pkgname"
	meson build
	meson compile -C build
}

package() {
    cd "$pkgname"
	meson install -C build
}

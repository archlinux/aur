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
source=('https://github.com/AhoyISki/wayfire-firedecor')
sha256sums=('SKIP')

pkgver() {
    printf "1.%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	meson build
	meson compile -C build
}

package() {
	meson install -C build
}

# Maintainer: Philip Goto <philip.goto@gmail.com>

pkgname=gnome-shell-extension-do-not-disturb-git
pkgver=r31.93f3ccb
pkgrel=1
pkgdesc="Enable or disable do not disturb mode"
arch=(any)
url="https://github.com/kylecorry31/gnome-shell-extension-do-not-disturb"
license=(MIT)
depends=(gnome-shell)
provides=(gnome-shell-extension-do-not-disturb)
conflicts=(gnome-shell-extension-do-not-disturb)
source=("git+https://github.com/kylecorry31/gnome-shell-extension-do-not-disturb.git")
sha256sums=(SKIP)

pkgver() {
    cd gnome-shell-extension-do-not-disturb
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd gnome-shell-extension-do-not-disturb
    make
}

package() {
    cd gnome-shell-extension-do-not-disturb
    make DESTDIR="$pkgdir/" install
}

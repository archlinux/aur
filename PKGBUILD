# Maintainer: Philip Goto <philip.goto@gmail.com>

pkgname=gnome-shell-extension-do-not-disturb-git
pkgver=2.0.0.r0.g27ef26f
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
    git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd gnome-shell-extension-do-not-disturb
    make
}

package() {
    cd gnome-shell-extension-do-not-disturb
    make DESTDIR="$pkgdir/" install
}

# Maintainer: Ícar N. S. <personal@icarns.xyz>

pkgname=gnome-shell-extension-dock-from-dash-git
pkgdesc="A simple dock for the GNOME Shell that uses its native dash."
pkgver=r27.52aeb23
pkgrel=1
arch=(any)
url='https://github.com/fthx/dock-from-dash'
license=(GPL3)
depends=('gnome-shell')
makedepends=('git' 'meson')
source=('dock-from-dash::git+https://github.com/fthx/dock-from-dash')
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/dock-from-dash"
    echo r$(git rev-list --count main).$(git rev-parse --short main)
}
build() {
    cd "$srcdir/dock-from-dash/"
    meson --prefix="$pkgdir/usr" .build
}
package() {
    cd "$srcdir/dock-from-dash/"
    ninja -C .build install
}

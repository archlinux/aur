# Maintainer: Ícar N. S. <personal@icarns.xyz>

pkgname=gnome-shell-extension-dock-from-dash-git
pkgdesc="A simple dock for the GNOME Shell that uses its native dash."
pkgver=r24.14e139f
pkgrel=1
arch=(any)
url='https://github.com/fthx/dock-from-dash'
license=(unknown)
depends=('gnome-shell')
makedepends=('git')
source=('dock-from-dash::git+https://github.com/fthx/dock-from-dash')
md5sums=('SKIP')

pkgver() {
    cd "$srcdir"/dock-from-dash
    echo r$(git rev-list --count main).$(git rev-parse --short main)
}

package() {
    cd "$srcdir"/dock-from-dash/
    mkdir -p "$pkgdir/usr/share/gnome-shell/extensions/dock-from-dash@fthx"
    unzip dock-from-dash@fthx.zip -d "$pkgdir/usr/share/gnome-shell/extensions/dock-from-dash@fthx"
}

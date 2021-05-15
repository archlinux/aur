# Maintainer: Zhang Shiwei <ylxdzsw@gmail.com>

pkgname=gnome-shell-extension-just-perfection-desktop-git
pkgdesc="Just Perfection GNOME Shell Desktop"
pkgver=r271.3b04e6f
pkgrel=1
arch=(any)
url='https://gitlab.gnome.org/jrahmatzadeh/just-perfection'
license=(GPL3 'CC0 1.0')
depends=('gnome-shell')
makedepends=('git')
source=('git+https://gitlab.gnome.org/jrahmatzadeh/just-perfection.git')
md5sums=('SKIP')

pkgver() {
    cd "$srcdir"/just-perfection
    echo r$(git rev-list --count master).$(git rev-parse --short master)
}

package() {
    cd "$srcdir"/just-perfection/
    bash scripts/build.sh
    mkdir -p "$pkgdir/usr/share/gnome-shell/extensions/just-perfection-desktop@just-perfection"
    unzip just-perfection-desktop@just-perfection.shell-extension.zip -d "$pkgdir/usr/share/gnome-shell/extensions/just-perfection-desktop@just-perfection"
}

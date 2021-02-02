# Maintainer: Zhang Shiwei <ylxdzsw@gmail.com>

pkgname=gnome-shell-extension-just-perfection-desktop-git
pkgdesc="Just Perfection GNOME Shell Desktop"
pkgver=r95.49d5c4b
pkgrel=1
arch=(any)
url='https://gitlab.com/justperfection.channel/just-perfection-gnome-shell-desktop'
license=(GPL3, 'CC0 1.0')
depends=('gnome-shell')
makedepends=('git')
source=('git+https://gitlab.com/justperfection.channel/just-perfection-gnome-shell-desktop.git')
md5sums=('SKIP')

pkgver() {
    cd "$srcdir"/just-perfection-gnome-shell-desktop
    echo r$(git rev-list --count master).$(git rev-parse --short master)
}

package() {
    cd "$srcdir"/just-perfection-gnome-shell-desktop/
    bash scripts/build.sh
    mkdir -p "$pkgdir/usr/share/gnome-shell/extensions/just-perfection-desktop@just-perfection"
    unzip just-perfection-desktop@just-perfection.shell-extension.zip -d "$pkgdir/usr/share/gnome-shell/extensions/just-perfection-desktop@just-perfection"
}

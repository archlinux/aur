# Maintainer: Zhang Shiwei <ylxdzsw@gmail.com>

pkgname=gnome-shell-extension-local-scripts-git
pkgdesc="Scripts are just clicks away"
pkgver=0
pkgrel=1
arch=(any)
url='https://github.com/ylxdzsw/gnome-shell-extension-local-scripts'
license=(GPL3)
depends=('gnome-shell' 'polkit')
makedepends=('git')
source=('git+https://github.com/ylxdzsw/gnome-shell-extension-local-scripts.git')
md5sums=('SKIP')

pkgver() {
    cd "$srcdir"/gnome-shell-extension-local-scripts
    echo r$(git rev-list --count master).$(git rev-parse --short master)
}

package() {
    mkdir -p "$pkgdir/usr/share/gnome-shell/extensions/"
    cp -r "$srcdir/gnome-shell-extension-local-scripts/local-scripts@ylxdzsw.com" "$pkgdir/usr/share/gnome-shell/extensions"
}
# Maintainer: Zhang Shiwei <ylxdzsw@gmail.com>

pkgname=gnome-shell-extension-shadowsocks-git
pkgdesc="Manage shadowsocks from panel menu. Support Surge subscription."
pkgver=r88.853af0b
pkgrel=1
arch=(any)
url='https://github.com/ylxdzsw/gnome-shell-extension-shadowsocks'
license=(GPL3)
depends=('gnome-shell' 'curl')
makedepends=('git')
optdepends=('shadowsocks: provides sslocal' 'shadowsocks-libev: provides ss-local')
source=('git+https://github.com/ylxdzsw/gnome-shell-extension-shadowsocks.git')
md5sums=('SKIP')

pkgver() {
    cd "$srcdir"/gnome-shell-extension-shadowsocks
    echo r$(git rev-list --count master).$(git rev-parse --short master)
}

package() {
    mkdir -p "$pkgdir/usr/share/gnome-shell/extensions/"
    cp -r "$srcdir/gnome-shell-extension-shadowsocks/shadowsocks@ylxdzsw.com" "$pkgdir/usr/share/gnome-shell/extensions"
}
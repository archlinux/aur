# Maintainer: Paulo Diovani <paulo AT diovani DOT com>

pkgname=gnome-shell-extension-disable-workspace-switcher-popup-git
pkgver=486e131
pkgrel=1
pkgdesc="Gnome Shell 3 extension that disables the arrow displayed during workspace switching."
arch=('any')
url="https://github.com/windsorschmidt/disable-workspace-switcher-popup"
depends=('gnome-shell>=3.0.2' 'xorg-xprop')
makedepends=('git')
provides=("${pkgname/-git}")
source=("$pkgname::git+$url")
md5sums=('SKIP')

pkgver() {
    cd "$pkgname"
    git describe --always
}

package() {
    cd "$pkgname"
    # mkdir -p "$pkgdir/usr/share/gnome-shell/extensions/"
    # cp -R "disable-workspace-switcher-popup@github.com" "$pkgdir/usr/share/gnome-shell/extensions"
    mkdir -p "$pkgdir/usr/share/gnome-shell/extensions"
    cp -r disable-workspace-switcher-popup@github.com "$pkgdir/usr/share/gnome-shell/extensions/"
}

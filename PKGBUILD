# Maintainer: parham < parham at tuta dot io >

pkgname=gnome-shell-extension-arc-menu-git
pkgver=46.1.dev.r0.ced0ff05
pkgrel=1
pkgdesc="A GNOME shell extension designed to replace the standard menu found in GNOME 3, git version"
arch=(any)
url="https://gitlab.com/arcmenu-team/Arc-Menu"
license=('GPL2')
depends=('gnome-shell>=3.18' 'gnome-menus')
makedepends=('git')
conflicts=('gnome-shell-extension-arc-menu')
install='gnome-shell-extension.install'
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
    cd Arc-Menu
    git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
    cd Arc-Menu
    make DESTDIR="$pkgdir" INSTALL="system" install
}

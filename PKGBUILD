# Maintainer: Razer <razer[AT]neuf[DOT]fr>
pkgname=bubblemail-gnome-shell
pkgver=0.1
pkgrel=0
pkgdesc="Unread mail notification service: Gnome shell extension"
pkgfolder="${pkgname}-v${pkgver}"
arch=(any)
url="https://framagit.org/razer/bubblemail-gnome-shell.git"
license=('GPL2')
makedepends=('meson')
depends=('dconf' 'gnome-shell' 'bubblemail')
source=("https://framagit.org/razer/${pkgname}/-/archive/v${pkgver}/${pkgname}-v${pkgver}.tar.bz2")
sha256sums=('39447f362935f58c9d7e68fcc2957eff072df57e133f0c46648ecaa74dbe7a47')

build() {
    cd ${srcdir}/${pkgfolder}
    meson -Dprefix=/usr _build
    ninja -C _build build
}

package() {
    cp -r ${srcdir}/${pkgfolder}/_build/_package/* ${pkgdir}
}

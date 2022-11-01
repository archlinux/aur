# Maintainer: Razer <razer[AT]neuf[DOT]fr>
pkgname=gnome-shell-extension-bubblemail
pkgver=19
pkgrel=0
pkgdesc="New and unread mail indicator (Local, Imap, Pop3, Gmail, Yahoo mail...) for gnome shell"
pkgfolder="bubblemail-gnome-shell"
arch=(any)
url="https://framagit.org/razer/bubblemail-gnome-shell/"
license=('GPL2')
makedepends=('meson')
depends=('dconf' 'gnome-shell' 'bubblemail')
source=("https://framagit.org/razer/${pkgfolder}/-/archive/v${pkgver}/${pkgfolder}-v${pkgver}.tar.bz2")
sha256sums=('2d4d53d9c329e9576941ee8d2415d4bb2431c334e898d8327dd36f9e0617f111')

build() {
    cd ${srcdir}/${pkgfolder}-v${pkgver}
    meson -Dprefix=/usr _build
    ninja -C _build build
}

package() {
    cp -r ${srcdir}/${pkgfolder}-v${pkgver}/_build/_package/* ${pkgdir}
}

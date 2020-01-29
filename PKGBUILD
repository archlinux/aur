# Maintainer: Razer <razer[AT]neuf[DOT]fr>
pkgname=bubblemail-gnome-shell
pkgver=0.5
pkgrel=0
pkgdesc="New and unread mail indicator (Local, Imap, Pop3, Gmail, Yahoo mail...) for gnome shell"
pkgfolder="${pkgname}-v${pkgver}"
arch=(any)
url="https://framagit.org/razer/bubblemail-gnome-shell/"
license=('GPL2')
makedepends=('meson')
depends=('dconf' 'gnome-shell' 'bubblemail')
source=("https://framagit.org/razer/${pkgname}/-/archive/v${pkgver}/${pkgname}-v${pkgver}.tar.bz2")
sha256sums=('f70543da332d93eda9780edace02c98345590a1b1599a53150fa54bf908be4b5')

build() {
    cd ${srcdir}/${pkgfolder}
    meson -Dprefix=/usr _build
    ninja -C _build build
}

package() {
    cp -r ${srcdir}/${pkgfolder}/_build/_package/* ${pkgdir}
}

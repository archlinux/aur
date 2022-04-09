# Maintainer: Razer <razer[AT]neuf[DOT]fr>
pkgname=gnome-shell-extension-bubblemail
pkgver=16
pkgrel=0
pkgdesc="New and unread mail indicator (Local, Imap, Pop3, Gmail, Yahoo mail...) for gnome shell"
pkgfolder="bubblemail-gnome-shell"
arch=(any)
url="https://framagit.org/razer/bubblemail-gnome-shell/"
license=('GPL2')
makedepends=('meson')
depends=('dconf' 'gnome-shell' 'bubblemail')
source=("https://framagit.org/razer/${pkgfolder}/-/archive/v${pkgver}/${pkgfolder}-v${pkgver}.tar.bz2")
sha256sums=('ae2fd8e2e05e1284151963af3380554df2c1f517850415ab2ca088d4701af755')

build() {
    cd ${srcdir}/${pkgfolder}-v${pkgver}
    meson -Dprefix=/usr _build
    ninja -C _build build
}

package() {
    cp -r ${srcdir}/${pkgfolder}-v${pkgver}/_build/_package/* ${pkgdir}
}

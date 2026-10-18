# Maintainer: Razer <razer[AT]neuf[DOT]fr>
pkgname=gnome-shell-extension-bubblemail
pkgver=32
pkgrel=0
pkgdesc="New and unread mail indicator (Local, Imap, Pop3, Gmail, Yahoo mail...) for gnome shell"
pkgfolder="bubblemail-gnome-shell"
arch=(any)
url="https://framagit.org/razer/bubblemail-gnome-shell/"
license=('GPL2')
makedepends=('meson')
depends=('dconf' 'gnome-shell' 'bubblemail')
source=("https://framagit.org/razer/${pkgfolder}/-/archive/v${pkgver}/${pkgfolder}-v${pkgver}.tar.bz2")
sha256sums=('36b7a8353f9c5ef31fee4076d24db0c3588ff4eefc001fca6d9ce4ab37273de6')

build() {
    cd ${srcdir}/${pkgfolder}-v${pkgver}
    meson setup -Dprefix=/usr _build
    ninja -C _build build
}

package() {
    cp -r ${srcdir}/${pkgfolder}-v${pkgver}/_build/_package/* ${pkgdir}
}


# Maintainer: Razer <razer[AT]neuf[DOT]fr>
pkgname=bubblemail-gnome-shell-git
pkgver=0.69
pkgrel=0
pkgdesc="Unread mail notification service: Gnome shell extension"
pkgfolder="bubblemail-gnome-shell-master"
provides=("bubblemail-gnome-shell")
conflicts=("bubblemail-gnome-shell")
arch=(any)
url="https://framagit.org/razer/bubblemail-gnome-shell/"
license=('GPL2')
makedepends=('meson')
depends=('dconf' 'gnome-shell' 'bubblemail')
source=("https://framagit.org/razer/bubblemail-gnome-shell/-/archive/master/${pkgfolder}.tar.bz2")
sha256sums=('SKIP')

build() {
    cd ${srcdir}/${pkgfolder}
    meson -Dprefix=/usr _build
    ninja -C _build build
}

package() {
    cp -r ${srcdir}/${pkgfolder}/_build/_package/* ${pkgdir}
}

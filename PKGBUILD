# Maintainer: Razer <razer[AT]neuf[DOT]fr>
pkgname=bubblemail
pkgver=1.11
pkgrel=0
pkgdesc="New and Unread mail notification service for local mailboxes, pop, imap, and gnome online accounts"
pkgfolder="${pkgname}-V${pkgver}"
arch=(any)
url="https://framagit.org/razer/bubblemail/"
license=('GPL2')
makedepends=('meson' 'python-pillow' 'vala' 'folks')
depends=('python' 'python-dbus' 'python-gobject' 'python-pysocks' 'python-requests' 'python-pyxdg' 'libsecret' 'gnome-keyring')
optdepends=('gnome-online-accounts' 'gnome-shell' 'gnome-shell-extension-bubblemail' 'folks')
source=("https://framagit.org/razer/${pkgname}/-/archive/V${pkgver}/${pkgfolder}.tar.bz2")
sha256sums=('40fa25e0bc6b347df18f470263883b0a8e2ab0c6a46a3b891e716c0dec1b9484')

build() {
    cd "${srcdir}/${pkgfolder}"
    meson setup builddir --prefix=/usr || return 1
}

package() {
    cd "${srcdir}/${pkgfolder}/builddir"
    meson install --destdir=${pkgdir} || return 1
}

# Maintainer: Razer <razer[AT]neuf[DOT]fr>
pkgname=bubblemail
pkgver=1.12
pkgrel=0
pkgdesc="New and Unread mail notification service for local mailboxes, pop, imap, and gnome online accounts"
pkgfolder="${pkgname}-v${pkgver}"
arch=(any)
url="https://framagit.org/razer/bubblemail/"
license=('GPL2')
makedepends=('meson' 'python-pillow' 'vala' 'folks')
depends=('python' 'python-dbus' 'python-gobject' 'python-pysocks' 'python-requests' 'python-pyxdg' 'libsecret' 'gnome-keyring')
optdepends=('gnome-online-accounts' 'gnome-shell' 'gnome-shell-extension-bubblemail' 'folks')
source=("https://framagit.org/razer/${pkgname}/-/archive/v${pkgver}/${pkgfolder}.tar.bz2")
sha256sums=('becf86cb6f0b914563813f512cbee6b32527b943c34cbba20e3e39bab55ddbc0')

build() {
    cd "${srcdir}/${pkgfolder}"
    meson setup builddir --prefix=/usr || return 1
}

package() {
    cd "${srcdir}/${pkgfolder}/builddir"
    meson install --destdir=${pkgdir} || return 1
}

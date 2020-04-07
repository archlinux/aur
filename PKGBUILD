# Maintainer: Razer <razer[AT]neuf[DOT]fr>
pkgname=bubblemail-git
pkgver=0.699
pkgrel=0
pkgdesc="New and Unread mail notification service for local mailboxes, pop, imap, and gnome online accounts"
pkgfolder="bubblemail-master"
provides=("bubblemail")
conflicts=("bubblemail")
arch=(any)
url="https://framagit.org/razer/bubblemail/"
license=('GPL2')
makedepends=('python-setuptools' 'python-pillow' 'vala' 'folks')
depends=('python' 'python-dbus' 'python-gobject' 'python-requests' 'libsecret' 'gnome-keyring')
optdepends=('gnome-online-accounts' 'gnome-shell' 'bubblemail-gnome-shell-extension' 'folks')
source=("https://framagit.org/razer/bubblemail/-/archive/master/${pkgfolder}.tar.bz2")
sha256sums=('SKIP')

build() {
    cd "${srcdir}/${pkgfolder}"
    python setup.py build || return 1
}

package() {
    cd "${srcdir}/${pkgfolder}"
    python setup.py install --root=${pkgdir} --optimize=1 || return 1
}

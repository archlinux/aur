# Maintainer: Razer <razer[AT]neuf[DOT]fr>
pkgname=bubblemail
pkgver=0.5
pkgrel=0
pkgdesc="New and Unread mail notification service for local mailboxes, pop, imap, and gnome online accounts"
pkgfolder="${pkgname}-v${pkgver}"
arch=(any)
url="https://framagit.org/razer/bubblemail/"
license=('GPL2')
makedepends=('python-setuptools' 'python-pillow' 'vala' 'folks')
depends=('python' 'python-dbus' 'python-gobject' 'python-requests' 'libsecret' 'gnome-keyring')
optdepends=('gnome-online-accounts' 'gnome-shell' 'bubblemail-gnome-shell' 'folks')
source=("https://framagit.org/razer/${pkgname}/-/archive/v${pkgver}/${pkgfolder}.tar.bz2")
sha256sums=('86f8140d4056095ab82a40d73d557902045ca77ade5fadde0c3a26523d2429ef')

build() {
    cd "${srcdir}/${pkgfolder}"
    python setup.py build || return 1
}

package() {
    cd "${srcdir}/${pkgfolder}"
    python setup.py install --root=${pkgdir} --optimize=1 || return 1
}

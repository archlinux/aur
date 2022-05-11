# Maintainer: Razer <razer[AT]neuf[DOT]fr>
pkgname=bubblemail
pkgver=1.7.1
pkgrel=0
pkgdesc="New and Unread mail notification service for local mailboxes, pop, imap, and gnome online accounts"
pkgfolder="${pkgname}-v${pkgver}"
arch=(any)
url="https://framagit.org/razer/bubblemail/"
license=('GPL2')
makedepends=('python-setuptools' 'python-pillow' 'vala' 'folks')
depends=('python' 'python-dbus' 'python-gobject' 'python-requests' 'python-pyxdg' 'libsecret' 'gnome-keyring')
optdepends=('gnome-online-accounts' 'gnome-shell' 'gnome-shell-extension-bubblemail' 'folks')
source=("https://framagit.org/razer/${pkgname}/-/archive/v${pkgver}/${pkgfolder}.tar.bz2")
sha256sums=('fa97ed9c4d7db72be15048c65c506330145063450d355489990b6e3012586641')

build() {
    cd "${srcdir}/${pkgfolder}"
    python setup.py build || return 1
}

package() {
    cd "${srcdir}/${pkgfolder}"
    python setup.py install --root=${pkgdir} --optimize=1 || return 1
}

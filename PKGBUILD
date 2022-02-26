# Maintainer: Razer <razer[AT]neuf[DOT]fr>
pkgname=bubblemail
pkgver=1.6
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
sha256sums=('45c0108bee59238ffa38e7e1cb6607d37b681d0607667d3d71f48b4e5da10523')

build() {
    cd "${srcdir}/${pkgfolder}"
    python setup.py build || return 1
}

package() {
    cd "${srcdir}/${pkgfolder}"
    python setup.py install --root=${pkgdir} --optimize=1 || return 1
}

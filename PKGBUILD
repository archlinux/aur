# Maintainer: Razer <razer[AT]neuf[DOT]fr>
pkgname=bubblemail
pkgver=0.1
pkgrel=1
pkgdesc="Unread mail notification service"
pkgfolder="${pkgname}-v${pkgver}"
arch=(any)
url="https://framagit.org/razer/bubblemail/"
license=('GPL2')
makedepends=('python-setuptools' 'vala')
depends=('python' 'python-dbus' 'python-gobject' 'libsecret' 'gnome-keyring')
optdepends=('gnome-online-accounts' 'gnome-shell' 'bubblemail-gnome-shell-extension')
source=("https://framagit.org/razer/${pkgname}/-/archive/v0.1/${pkgname}-v0.1.tar.bz2")
sha256sums=('b4dd98744c97c21c170d71ea0b8dda8261e46fa8e2ed62ba80d30de74c4e1a9d')

build() {
    cd "${srcdir}/${pkgfolder}"
    python setup.py build || return 1
}

package() {
    cd "${srcdir}/${pkgfolder}"
    python setup.py install --root=${pkgdir} --optimize=1 || return 1
}

# Maintainer: Razer <razer[AT]neuf[DOT]fr>
pkgname=bubblemail
pkgver=0.1
pkgrel=0
pkgdesc="Unread mail notification service"
pkgfolder="${pkgname}-v${pkgver}"
arch=(any)
url=""
license=('GPL2')
makedepends=('python-setuptools' 'vala')
depends=('python' 'python-dbus' 'python-gobject' 'libsecret')
optdepends=('gnome-online-accounts' 'gnome-shell' 'bubblemail-gnome-shell-extension')
source=("https://framagit.org/razer/${pkgname}/-/archive/v0.1/${pkgname}-v0.1.tar.bz2")
sha256sums=('b5a25f6453e104f8b4f9baecac32ce2f2d36b8804677a8372827f96a3e6051e5')

build() {
    cd "${srcdir}/${pkgfolder}"
    python setup.py build || return 1
}

package() {
    cd "${srcdir}/${pkgfolder}"
    python setup.py install --root=${pkgdir} --optimize=1 || return 1
}

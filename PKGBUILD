# Maintainer: Razer <razer[AT]neuf[DOT]fr>
pkgname=bubblemail-git
pkgver=0.19
pkgrel=0
pkgdesc="Unread mail notification service"
pkgfolder="bubblemail-master"
provides=("bubblemail")
conflicts=("bubblemail")
arch=(any)
url="https://framagit.org/razer/bubblemail/"
license=('GPL2')
makedepends=('python-setuptools' 'vala')
depends=('python' 'python-dbus' 'python-gobject' 'libsecret' 'gnome-keyring')
optdepends=('gnome-online-accounts' 'gnome-shell' 'bubblemail-gnome-shell-extension')
source=("https://framagit.org/razer/bubblemail/-/archive/master/bubblemail-master.tar.bz2")
sha256sums=('SKIP')

build() {
    cd "${srcdir}/${pkgfolder}"
    python setup.py build || return 1
}

package() {
    cd "${srcdir}/${pkgfolder}"
    python setup.py install --root=${pkgdir} --optimize=1 || return 1
}

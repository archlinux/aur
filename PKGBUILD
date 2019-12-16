# Maintainer: Razer <razer[AT]neuf[DOT]fr>
pkgname=bubblemail
pkgver=0.3
pkgrel=0
pkgdesc="Unread mail notification service"
pkgfolder="${pkgname}-v${pkgver}"
arch=(any)
url="https://framagit.org/razer/bubblemail/"
license=('GPL2')
makedepends=('python-setuptools' 'python-pillow' 'vala' 'folks')
depends=('python' 'python-dbus' 'python-gobject' 'libsecret' 'gnome-keyring')
optdepends=('gnome-online-accounts' 'gnome-shell' 'bubblemail-gnome-shell-extension')
source=("https://framagit.org/razer/${pkgname}/-/archive/v${pkgver}/${pkgfolder}.tar.bz2")
sha256sums=('3221a33ed0190d5a15da65dc10ba912ece9f0b274d70c0c133236eef0e0196c3')

build() {
    cd "${srcdir}/${pkgfolder}"
    python setup.py build || return 1
}

package() {
    cd "${srcdir}/${pkgfolder}"
    python setup.py install --root=${pkgdir} --optimize=1 || return 1
}

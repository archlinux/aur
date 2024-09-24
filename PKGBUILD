# Maintainer: Adria Arrufat <swiftscythe at gmail dot com>

pkgname=gssp-recoll
pkgver=1.1.3
pkgrel=1
pkgdesc="GNOME Shell search provider for Recoll"
arch=(x86_64)
license=(BSD-3)
url="https://www.lesbonscomptes.com/recoll/"
depends=(gnome-shell recoll python-pydbus)
source=("https://www.recoll.org//downloads/src/${pkgname}-${pkgver}.tar.gz")
sha256sums=('1e61043d436823b693127976265a7288adffcbfa558b1e34895284eb00645bd2')

build() {
    cd ${pkgname}-${pkgver}
    ./configure --prefix=/usr
    make
}

package() {
    cd ${pkgname}-${pkgver}
    make DESTDIR=${pkgdir} install
}

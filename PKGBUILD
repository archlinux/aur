# Maintainer: Adria Arrufat <swiftscythe at gmail dot com>

pkgname=gssp-recoll
pkgver=1.1.0
pkgrel=3
pkgdesc="GNOME Shell search provider for Recoll"
arch=(x86_64)
license=(BSD-3)
url="https://www.lesbonscomptes.com/recoll/index.html"
depends=(gnome-shell recoll python-dbus)
source=("https://www.lesbonscomptes.com/recoll/downloads/${pkgname}-${pkgver}.tar.gz")
sha256sums=('b942cc75e58d180a1708d9763fa874ec229c4636723b85e36fe279a5d99ad574')

build() {
    cd ${pkgname}-${pkgver}
    ./configure --prefix=/usr
    make
}

package() {
    cd ${pkgname}-${pkgver}
    make DESTDIR=${pkgdir} install
}

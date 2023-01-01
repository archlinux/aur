# Maintainer: Adria Arrufat <swiftscythe at gmail dot com>

pkgname=gssp-recoll
pkgver=1.1.1
pkgrel=1
pkgdesc="GNOME Shell search provider for Recoll"
arch=(x86_64)
license=(BSD-3)
url="https://www.lesbonscomptes.com/recoll/"
depends=(gnome-shell recoll python-pydbus)
source=("https://www.lesbonscomptes.com/recoll/downloads/${pkgname}-${pkgver}.tar.gz")
sha256sums=('0925b512f2d76b849749a93cc0c15f041aad4b62e44867aee0497d7c404dfda6')

build() {
    cd ${pkgname}-${pkgver}
    ./configure --prefix=/usr
    make
}

package() {
    cd ${pkgname}-${pkgver}
    make DESTDIR=${pkgdir} install
}

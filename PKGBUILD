# Maintainer: max.bra <max dot bra dot gtalk at gmail dot com>

pkgname=desktopfolder
pkgver=1.1.1
pkgrel=1
pkgdesc='Organize your desktop with panels that hold your things.'
arch=('i686' 'x86_64')
url='https://github.com/spheras/desktopfolder'
license=('GPL3')
depends=('libwnck3' 'gtksourceview3')
makedepends=('meson' 'ninja' 'vala' 'intltool')
source=("https://github.com/spheras/${pkgname}/archive/v${pkgver}.zip")

sha256sums=('ce6c07eb3696625731e53efb15f413b49f8b888d02bc2f778978c0ab9eecefe0')

build() {
    cd ${pkgname}-${pkgver}
    meson build --prefix=/usr
    cd build
    meson configure
    ninja
}

package() {
    cd ${pkgname}-${pkgver}
    DESTDIR="${pkgdir}" ninja -C build install
}

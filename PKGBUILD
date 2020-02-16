# Maintainer: max.bra <max dot bra dot gtalk at gmail dot com>

pkgname=desktopfolder
pkgver=1.1.2
pkgrel=1
pkgdesc='Organize your desktop with panels that hold your things.'
arch=('i686' 'x86_64')
url='https://github.com/spheras/desktopfolder'
license=('GPL3')
depends=('libwnck3' 'gtksourceview3')
makedepends=('meson' 'ninja' 'vala' 'intltool')
source=("https://github.com/spheras/${pkgname}/archive/v${pkgver}.zip")

sha256sums=('f01e3d378af6ccb26097b69553e280b391b1e4dd1648b355ccd1e0dd767d4d09')

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

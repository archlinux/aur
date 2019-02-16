# Maintainer: max.bra <max dot bra dot gtalk at gmail dot com>

pkgname=desktopfolder
pkgver=1.1.0
pkgrel=1
pkgdesc='Organize your desktop with panels that hold your things.'
arch=('i686' 'x86_64')
url='https://github.com/spheras/desktopfolder'
license=('GPL3')
depends=('libwnck3' 'gtksourceview3')
makedepends=('meson' 'ninja' 'vala' 'intltool')
source=("https://github.com/spheras/${pkgname}/releases/download/v.${pkgver}/desktopfolder-${pkgver}.tar.xz")

sha256sums=('1e797727ee23485b12eb9357c9b41d22e769a3f1252eeeb6d1dd298797df21f9')

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

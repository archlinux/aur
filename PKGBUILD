# Maintainer: max.bra <max dot bra dot gtalk at gmail dot com>

pkgname=desktopfolder
pkgver=1.0.10
pkgrel=1
pkgdesc='Organize your desktop with panels that hold your things.'
arch=('i686' 'x86_64')
url='https://github.com/spheras/desktopfolder'
license=('GPL3')
depends=('libwnck3' 'gtksourceview3')
makedepends=('meson' 'ninja' 'vala')
source=("https://github.com/spheras/${pkgname}/archive/v${pkgver}.tar.gz")

sha256sums=('3cecc212882f6a8b03f03adb5582d4fb69f0433478f6175072a50a387bfd3d44')

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

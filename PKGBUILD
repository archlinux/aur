# Maintainer: max.bra <max dot bra dot gtalk at gmail dot com>

pkgname=desktopfolder
pkgver=1.0.6
pkgrel=1
pkgdesc='Organize your desktop with panels that hold your things.'
arch=('i686' 'x86_64')
url='https://github.com/spheras/desktopfolder'
license=('GPL3')
depends=('libwnck3' 'gtksourceview3')
makedepends=('meson' 'ninja')
source=("https://github.com/spheras/${pkgname}/archive/v${pkgver}.tar.gz")

sha256sums=('53661487ace8aca87b47a353d0280c0713ab95474e986436bab477357527a7b3')

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

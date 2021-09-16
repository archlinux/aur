# Maintainer: Tomoghno Sen <tomoghno@outlook.com>

pkgname='fondo'
pkgver=1.6.1
pkgrel=1
pkgdesc='Wallpaper App for Linux'
arch=('x86_64')
changelog='CHANGELOG'
url="https://github.com/calo001/${pkgname}"
license=('GPL3')
depends=('granite' 'libsoup' 'json-glib')
makedepends=('git' 'meson' 'vala')
conflicts=("${pkgname}-git")
source=("git+${url}.git#tag=${pkgver}")
sha256sums=('SKIP')

pkgver () {
    cd ${pkgname}
    git describe --tags | sed 's/-/.r/; s/-/./'
}

build () {
    arch-meson ${pkgname} build
    ninja -C build
}

package () {
    DESTDIR="${pkgdir}" ninja -C build install
}

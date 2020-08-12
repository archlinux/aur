# Maintainer: Artem Senichev <artemsen@gmail.com>

pkgname=swaykbdd
pkgver=1.0
pkgrel=1
pkgdesc='Per-window keyboard layouts for Sway (KBDD replacement)'
arch=('x86_64')
license=('MIT')
makedepends=('meson' 'ninja')
depends=('json-c')
url='https://github.com/artemsen/swaykbdd'
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
md5sums=('d7371d58205468ac73dfdbe9975f8c41')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    meson --prefix=/usr "${srcdir}/build"
    ninja -C "${srcdir}/build"
}

package(){
    cd "${srcdir}/${pkgname}-${pkgver}"
    DESTDIR="${pkgdir}" ninja -C "${srcdir}/build" install
}

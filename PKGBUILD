# Maintainer: Artem Senichev <artemsen@gmail.com>

pkgname=swayimg
pkgver=1.0
pkgrel=1
pkgdesc='Image viewer for Sway/Wayland'
arch=('x86_64')
license=('MIT')
makedepends=('meson' 'ninja' 'wayland-protocols')
depends=('wayland' 'cairo' 'json-c')
optdepends=('libjpeg: JPEG images support'
            'giflib: GIF images support')
url='https://github.com/artemsen/swayimg'
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
md5sums=('308063c564fdc97dad40c6b5ea227d88')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    meson --prefix=/usr "${srcdir}/build"
    ninja -C "${srcdir}/build"
}

package(){
    cd "${srcdir}/${pkgname}-${pkgver}"
    DESTDIR="${pkgdir}" ninja -C "${srcdir}/build" install
}

# Maintainer: Vbextreme <@>
# Contributor: Vbextreme <@>
pkgname=('terminalgraphics')
pkgdesc='display image and video on terminal'
pkgver='0.7'
pkgrel=1
arch=('x86_64')
url='https://github.com/vbextreme/tg'
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/vbextreme/tg/archive/v${pkgver}.tar.gz")
license=('GPL3')
sha256sums=('SKIP')
makedepends=('meson')
depends=('easyframework')

prepare() {
    cd "tg-${pkgver}"
    meson build -Dprefix=/usr
}

build() {
    cd "tg-${pkgver}/build"
    ninja
}

package() {
    cd "tg-${pkgver}/build"
    DESTDIR="$pkgdir" ninja install
}


# Maintainer: Vbextreme <@>
# Contributor: Vbextreme <@>
pkgname=('ccdoc')
pkgdesc='create HTML, README.md, WIKI, MAN, from C comment'
pkgver='1.0.0'
pkgrel=1
arch=('x86_64')
url='https://github.com/vbextreme/ccdoc'
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/vbextreme/ccdoc/archive/v${pkgver}.tar.gz")
license=('GPL3')
sha256sums=('SKIP')
makedepends=('meson')
#depends=('')

prepare() {
    cd "ccdoc-${pkgver}"
    meson build
}

build() {
    cd "ccdoc-${pkgver}/build"
    ninja
}

package() {
    cd "ccdoc-${pkgver}/build"
    DESTDIR="$pkgdir" ninja install
}


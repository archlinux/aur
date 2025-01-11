# Maintainer: Vbextreme <@>
# Contributor: Vbextreme <@>
prj='hestia'
pkgname=($prj)
pkgdesc='hestia is a godness protect your root'
pkgver='0.2.2'
pkgrel=1
arch=('x86_64')
url="https://github.com/vbextreme/${prj}.git"
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/vbextreme/${prj}/archive/v${pkgver}.tar.gz")
license=('GPL3')
sha256sums=('SKIP')
makedepends=('meson' 'ninja')
depends=('readline')

prepare() {
    cd "${prj}-${pkgver}"
    meson setup build -Dprefix=/usr
}

build() {
    cd "${prj}-${pkgver}/build"
    ninja
}

package() {
    cd "${prj}-${pkgver}/build"
    DESTDIR="$pkgdir" ninja install
}


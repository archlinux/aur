# This PKGBUILD is maintained at: https://github.com/majewsky/system-configuration/tree/master/holo
pkgname='holo'
pkgver=0.3.0
pkgrel=1
pkgdesc='Minimal configuration management'
arch=('x86_64')
url='https://github.com/majewsky/holo'
license=('GPL2')
makedepends=('go')
replaces=('holo-tools')
source=("https://github.com/majewsky/holo/archive/v${pkgver}.tar.gz")
md5sums=('390dd66f50144ea6db015a7deb8156b8')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    make
}

# NOTE: We cannot check() here since the "make check" only runs correctly inside a Git clone of Holo.

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    make install DESTDIR="${pkgdir}"
}

pkgname='holo-build'
pkgver=1.0
pkgrel=1
pkgdesc='Cross-distribution system package compiler'
arch=('i686' 'x86_64')
url='http://holocm.org'
license=('GPL3')
depends=(
    'fakeroot'
    'pacman' # used by the pacman generator to resolve package groups
)
makedepends=('go' 'perl')
source=("https://github.com/holocm/${pkgname}/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
md5sums=('85be847194797b8df01a43876794aa22')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    make
}

check() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    make check
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    make install DESTDIR="${pkgdir}"
}

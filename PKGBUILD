pkgname='holo-build'
pkgver=1.4
pkgrel=1
pkgdesc='Cross-distribution system package compiler'
arch=('i686' 'x86_64' 'armv7h')
url='http://holocm.org'
license=('GPL3')
depends=(
    'pacman' # used by the pacman generator to resolve package groups
    'xz'
)
makedepends=('go' 'perl')
source=("https://github.com/holocm/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('a6c998efa6288a45f8e721304c0fb7f49f24dd1d5a71f41118c198f7fdfa0c43')

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

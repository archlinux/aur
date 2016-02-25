pkgname='holo-build'
pkgver=1.2
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
md5sums=('3b0613770d9aa352880d237626237860')

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

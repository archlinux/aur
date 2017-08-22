pkgname='holo-build'
pkgver=1.5.1
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
sha256sums=('6683271cf68fe0693ee9a55a4847ee9c950f8d37500d92bbec47b846ba4695af')

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

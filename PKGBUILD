pkgname=holo-build
pkgver=1.6.1
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
sha256sums=('00ca7d1cfda43682af83fa0fd504180887e2801078bc7a8cefca8b460605398e')

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

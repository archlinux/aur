pkgname='holo-run-scripts'
pkgver=1.0
pkgrel=1
pkgdesc='Holo plugin for running custom provisioning scripts'
arch=('any')
url='http://holocm.org'
license=('GPL3')
depends=(
    'HOLO_API_VERSION=1'
)
makedepends=('perl')
install='holo-run-scripts.install'
source=("https://github.com/holocm/${pkgname}/archive/v${pkgver}.tar.gz")
md5sums=('9b6c1e7878cb789d53cf8028de2b3474')

check() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    make check
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    make install DESTDIR="${pkgdir}"
}

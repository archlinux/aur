pkgname='holo-run-scripts'
pkgver=1.1
pkgrel=1
pkgdesc='Holo plugin for running custom provisioning scripts'
arch=('any')
url='http://holocm.org'
license=('GPL3')
depends=(
    'HOLO_API_VERSION=2'
)
makedepends=('perl')
install='holo-run-scripts.install'
source=("https://github.com/holocm/${pkgname}/archive/v${pkgver}.tar.gz")
md5sums=('c726e7cc3b4de667f1bc0fb15859c26b')

check() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    make check
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    make install DESTDIR="${pkgdir}"
}

pkgname='holo-users-groups'
pkgver=1.1
pkgrel=1
pkgdesc='Holo plugin for provisioning user accounts and groups'
arch=('i686' 'x86_64')
url='http://holocm.org'
license=('GPL3')
depends=(
    'HOLO_API_VERSION=2'
    'shadow'
)
makedepends=('go' 'perl')
install='holo-users-groups.install'
source=("https://github.com/holocm/${pkgname}/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
md5sums=('6f4591f82320077f64518181c774f3f2')

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

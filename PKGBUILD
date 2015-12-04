pkgname='holo-users-groups'
pkgver=1.0
pkgrel=1
pkgdesc='Holo plugin for provisioning user accounts and groups'
arch=('i686' 'x86_64')
url='http://holocm.org'
license=('GPL3')
depends=(
    'HOLO_API_VERSION=1'
    'shadow'
)
makedepends=('go' 'perl')
install='holo-users-groups.install'
source=("https://github.com/holocm/${pkgname}/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
md5sums=('ed720214413105c546eef7d45e828bbf')

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

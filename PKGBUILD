pkgname='holo-users-groups'
pkgver=1.2
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
md5sums=('40c877337157c5a138cef726ca862851')

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

pkgname='holo-users-groups'
pkgver=2.0
pkgrel=1
pkgdesc='Holo plugin for provisioning user accounts and groups'
arch=('i686' 'x86_64' 'armv7h')
url='http://holocm.org'
license=('GPL3')
depends=(
    'HOLO_API_VERSION=3'
    'shadow'
)
makedepends=('go' 'perl')
install='holo-users-groups.install'
source=("https://github.com/holocm/${pkgname}/archive/v${pkgver}.tar.gz")
md5sums=('dddb00371d10c5225d699dfcaf195b22')

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

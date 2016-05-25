pkgname='holo-users-groups'
pkgver=2.1
pkgrel=1
pkgdesc='Holo plugin for provisioning user accounts and groups'
arch=('i686' 'x86_64' 'armv7h')
url='http://holocm.org'
license=('GPL3')
depends=(
    'holo>=1.2'
    'holo<2.0'
    'shadow'
)
makedepends=('go' 'perl')
source=("https://github.com/holocm/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('11deb7566129eb412bcbae6e76ddb7045a7082cad6ef314a236811ed9102464e')

options=('!strip') # binaries are already stripped inside the Makefile

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

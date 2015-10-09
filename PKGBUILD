# This PKGBUILD is maintained at: https://github.com/majewsky/system-configuration/tree/master/holo
pkgname='holo'
pkgver=0.7.0
pkgrel=1
pkgdesc='Minimalistic configuration management'
arch=('x86_64')
url='http://holocm.org'
license=('GPL2')
depends=('shadow')
makedepends=('go' 'perl')
source=("https://github.com/holocm/holo/releases/download/v${pkgver}/holo-${pkgver}.tar.gz")
md5sums=('14ff83a1567e05ff857702a60bc5074e')

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

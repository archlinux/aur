# Maintainer: Vincent Bernardoff <vb@luminar.eu.org>

pkgname=clasp
groups=('potassco')
pkgver=3.1.2
pkgrel=1
pkgdesc="A conflict-driven nogood learning answer set solver."
arch=('x86_64' 'i686' 'armv6h' 'armv7h')
url="http://potassco.sourceforge.net/"
license=('GPL3')
depends=()
source=("http://downloads.sourceforge.net/project/potassco/${pkgname}/${pkgver}/${pkgname}-${pkgver}-source.tar.gz")
sha1sums=(bcfbd98a842f3f70a2d0e49f382cc2392ddad7ba)

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    ./configure.sh --prefix='/usr'
    cd build/release
    make
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}/build/release/bin"
    install -D "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}

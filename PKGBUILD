# Maintainer: Vincent Bernardoff <vb@luminar.eu.org>

pkgname=gringo
groups=('potassco')
pkgver=4.5.0
pkgrel=1
pkgdesc="Grounding tools for (disjunctive) logic programs."
arch=('x86_64' 'i686' 'armv6h' 'armv7h')
url="http://potassco.sourceforge.net/"
license=('GPL3')
depends=()
makedepends=('bison' 're2c' 'scons')
source=(
    "http://downloads.sourceforge.net/project/potassco/${pkgname}/${pkgver}/${pkgname}-${pkgver}-source.tar.gz")
sha1sums=(bbe67ed1d5c6f5ca6d5958e04b706595d39b4653)
build() {
    cd "${srcdir}/${pkgname}-${pkgver}-source"
    scons --build-dir=release ${pkgname}
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}-source/build/release"
    install -D ${pkgname} ${pkgdir}/usr/bin/${pkgname}
}

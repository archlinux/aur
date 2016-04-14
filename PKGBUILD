# Maintainer: Vincent Bernardoff <vb@luminar.eu.org>

pkgname=clingo
groups=('potassco')
pkgver=4.5.4
pkgrel=1
pkgdesc="Grounding tools for (disjunctive) logic programs."
arch=('x86_64' 'i686' 'armv6h' 'armv7h')
url="http://potassco.sourceforge.net/"
license=('GPL3')
depends=()
makedepends=('bison' 're2c' 'scons')
source=(
    "http://downloads.sourceforge.net/project/potassco/${pkgname}/${pkgver}/${pkgname}-${pkgver}-source.tar.gz")
sha1sums=(bf039e6aacefba7814de1e9c82e57da0784839fb)

build() {
    cd "${srcdir}/${pkgname}-${pkgver}-source"
    scons --build-dir=release ${pkgname}
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}-source/build/release"
    install -D ${pkgname} ${pkgdir}/usr/bin/${pkgname}
}

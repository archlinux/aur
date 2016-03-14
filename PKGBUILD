# Maintainer: Vincent Bernardoff <vb@luminar.eu.org>

pkgname=gringo
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
sha1sums=(5eb5e077cf9e1a87baf2c18322e431158090d656)
build() {
    cd "${srcdir}/${pkgname}-${pkgver}-source"
    scons --build-dir=release ${pkgname}
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}-source/build/release"
    install -D ${pkgname} ${pkgdir}/usr/bin/${pkgname}
}

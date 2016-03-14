# Maintainer: Vincent Bernardoff <vb@luminar.eu.org>

pkgname=clasp
groups=('potassco')
pkgver=3.1.4
pkgrel=1
pkgdesc="A conflict-driven nogood learning answer set solver."
arch=('x86_64' 'i686' 'armv6h' 'armv7h')
url="http://potassco.sourceforge.net/"
license=('GPL3')
makedepends=('clang')
source=("http://downloads.sourceforge.net/project/potassco/${pkgname}/${pkgver}/${pkgname}-${pkgver}-source.tar.gz")
sha1sums=(5be43c2a912cdf1ea513e99c3f7173db1cad290d)

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    ./configure.sh --prefix='/usr' CXX=clang++
    cd build/release
    make
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}/build/release/bin"
    install -D "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}

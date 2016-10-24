# Maintainer: Vincent Bernardoff <vb@luminar.eu.org>

pkgname=clasp
groups=('potassco')
pkgver=3.2.1
pkgrel=1
pkgdesc="A conflict-driven nogood learning answer set solver."
arch=('x86_64' 'i686' 'armv6h' 'armv7h')
url="https://potassco.org"
license=('GPL3')
makedepends=('clang')
source=("https://github.com/potassco/${pkgname}/archive/${pkgver}.tar.gz")
sha1sums=(532a00a32ca03351f9e3961c055665d7782b5f06)

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    ./configure.sh --with-mt=std --prefix='/usr' CXX=clang++
    cd build/release_mt
    make
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}/build/release_mt/bin"
    install -D "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}

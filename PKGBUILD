# Maintainer: Giuseppe Sellaroli <g.sellaroli  at  yahoo  dot  it>
pkgname=fontbm
pkgver=0.5.0
pkgrel=1
pkgdesc="BMFont compatible command line bitmap font generator."
arch=('x86_64')
url="https://github.com/vladimirgamalyan/fontbm"
license=('MIT')
depends=('freetype2')
makedepends=('cmake')
source=("https://github.com/vladimirgamalyan/fontbm/archive/refs/tags/v${pkgver}.tar.gz")
md5sums=('76a242e85067acc2cbc6983ade15d1d7')

build() {      
        cd "${pkgname}-${pkgver}"
        cmake .
        make
}

package() {
        install -dm755 "${pkgdir}/usr/bin"
        install -m755 "${srcdir}/${pkgname}-${pkgver}/fontbm" "${pkgdir}/usr/bin/fontbm"
}

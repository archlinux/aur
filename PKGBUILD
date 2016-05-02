# $Id$
# Maintainer: Ivailo Monev <xakepa10@gmail.com>

pkgname=boost-bcp
pkgver=1.60.0
pkgdesc="The bcp utility is a tool for extracting subsets of Boost"
_boostver=${pkgver//./_}
pkgrel=1
url='http://www.boost.org/'
arch=('i686' 'x86_64')
license=('custom')
depends=('icu')
makedepends=('boost')
source=("https://downloads.sourceforge.net/project/boost/boost/${pkgver}/boost_${_boostver}.tar.bz2")
sha1sums=('7f56ab507d3258610391b47fef6b11635861175a')

build() {
    cd "${srcdir}/boost_${_boostver}/tools/bcp"
    b2
}

package() {
    cd "${srcdir}/boost_${_boostver}"

    install -Dm755 dist/bin/bcp "${pkgdir}/usr/bin/bcp"

    install -Dm644 "${srcdir}/boost_${_boostver}/LICENSE_1_0.txt" \
        "${pkgdir}/usr/share/licenses/boost-bcp/LICENSE_1_0.txt"
} 

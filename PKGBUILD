# Maintainer: Jan Cholasta <grubber at grubber cz>

pkgname=zdbsp
pkgver=1.19
pkgrel=1
pkgdesc="Standalone version of ZDoom's internal node builder"
arch=('i686' 'x86_64')
url="http://www.zdoom.org/"
license=('GPL')
depends=('gcc-libs' 'zlib')
makedepends=('cmake')
source=("http://zdoom.org/files/utils/${pkgname}/${pkgname}-${pkgver}-src.zip")
sha256sums=('b98956fb1c52f5e25062f829b2468cb8028492add0b7672654763f78dec10249')

prepare() {
    cmake -DCMAKE_BUILD_TYPE=Release .
}

build() {
    make
}

package() {
    install -D 'zdbsp' "${pkgdir}/usr/bin/zdbsp"
}

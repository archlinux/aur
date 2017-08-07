# Maintainer: Ross Whitfield <whitfieldre@ornl.gov>

pkgname=morebin
pkgver=2.3.4
pkgrel=2
pkgdesc="'more' for binary files"
url="https://github.com/peterfpeterson/morebin"
source=("https://github.com/peterfpeterson/morebin/archive/v$pkgver.tar.gz")
license=('MIT')
arch=('i686' 'x86_64')
makedepends=('cmake' 'boost')
depends=('boost-libs')
sha1sums=('8d1b7db395104e35a0ad88a8288ba88e57d06848')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    cmake -DCMAKE_INSTALL_PREFIX=/usr .
    make
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    make DESTDIR="${pkgdir}" install
}

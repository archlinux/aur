# Submitter: Gavin Lloyd <gavinhungry@gmail.com>
# Maintainer: Misaka13514 <Misaka13514 at gmail dot com>

pkgname=gqrx-scanner
pkgver=1.0.4
pkgrel=1
pkgdesc="A frequency scanner for Gqrx Software Defined Radio receiver"
arch=('x86_64')
url="https://github.com/neural75/gqrx-scanner"
license=('MIT')
depends=('glibc')
makedepends=('cmake')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('941c193ca7addf631615d6c714429f1f332e77750f075b555223105b9703f788')

build() {
    cmake -B build -S "${pkgname}-${pkgver}" \
        -DCMAKE_BUILD_TYPE='None' \
        -DCMAKE_INSTALL_PREFIX='/usr' \
        -Wno-dev
    cmake --build build
}

package() {
    DESTDIR="${pkgdir}" cmake --install build
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

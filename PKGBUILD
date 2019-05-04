# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>
pkgname=('highwayhash')
pkgver='1.1'
pkgrel=1
pkgdesc="Fast strong hash functions: SipHash/HighwayHash"
url="https://github.com/google/highwayhash"
depends=('gcc-libs')
makedepends=('git')
checkdepends=()
license=('Apache')
arch=('x86_64')
source=("git+https://github.com/google/highwayhash.git")
sha256sums=('SKIP')

build() {
    cd "${srcdir}/${pkgname}"
    make
}

package() {
    cd "${srcdir}/${pkgname}"
    make PREFIX=/usr DESTDIR="${pkgdir}" install
}

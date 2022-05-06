# Maintainer: PQCraft <0456523@gmail.com>

pkgname=bcbasic
ghpkgname=BCBASIC
pkgver=0.1.5
pkgrel=1
pkgdesc="ByteCodeBASIC"
arch=(x86_64 i686 pentium4 arm armv6h armv7h aarch64)
url="https://github.com/PQCraft/${ghpkgname}"
license=(GPL3)
depends=('readline')
makedepends=('make' 'readline')
conflicts=(bcbasic-bin)
source=("${pkgname}-${pkgver}-${pkgrel}.tar.gz::https://github.com/PQCraft/${ghpkgname}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('SKIP')

build() {
    cd "${srcdir}/${ghpkgname}-${pkgver}/"
    make -j$(nproc) build
}

check() {
    cd "${srcdir}/${ghpkgname}-${pkgver}/"
    [ -f ./bcbasic ]
}

package() {
    cd "${srcdir}/${ghpkgname}-${pkgver}/"
    install -Dm755 bcbasic -t "${pkgdir}/usr/bin/"
}


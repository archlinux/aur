# Maintainer: PQCraft <0456523@gmail.com>

pkgname=clibasic
pkgver=0.17.1
pkgrel=1
pkgdesc="A BASIC interpreter for the terminal written in C"
arch=(x86_64 i686 pentium4 arm armv6h armv7h aarch64)
url="https://github.com/PQCraft/clibasic"
license=(GPL3)
depends=('glibc' 'readline')
makedepends=('make' 'glibc' 'readline')
conflicts=(clibasic-bin)
source=("clibasic-${pkgver}-${pkgrel}.tar.gz::https://github.com/PQCraft/clibasic/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('SKIP')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}/"
    make build
}

check() {
    cd "${srcdir}/${pkgname}-${pkgver}/"
    [ -f ./clibasic ]
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}/"
    install -Dm755 clibasic -t "${pkgdir}/usr/bin/"
}


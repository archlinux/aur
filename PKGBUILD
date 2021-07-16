# Maintainer: PQCraft <0456523@gmail.com>

pkgname=clibasic
pkgver=0.16
pkgrel=4
pkgdesc="A BASIC interpreter for the terminal written in C"
arch=(x86_64 i686 pentium4 arm armv6h armv7h aarch64)
url="https://github.com/PQCraft/clibasic"
license=(GPL3)
depends=('glibc' 'readline')
makedepends=('make' 'glibc' 'readline')
conflicts=(clibasic-bin)
source=("clibasic-${pkgver}.tar.gz::https://github.com/PQCraft/clibasic/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('505bf67ae71d6af9df535e571a9d5035f26e7470ef9c36f6136967c9c3c0b855')

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


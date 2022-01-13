# Maintainer: PQCraft <0456523@gmail.com>

pkgname=clibasic
ghpkgname=CLIBASIC
pkgver=1.1.1
pkgrel=1
pkgdesc="A BASIC interpreter for the terminal, written in C"
arch=(x86_64 i686 pentium4 arm armv6h armv7h aarch64)
url="https://github.com/PQCraft/${ghpkgname}"
license=(GPL3)
depends=('glibc' 'readline')
makedepends=('make' 'glibc' 'readline')
conflicts=(clibasic-bin)
source=("${pkgname}-${pkgver}-${pkgrel}.tar.gz::https://github.com/PQCraft/${ghpkgname}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('SKIP')

build() {
    cd "${srcdir}/${ghpkgname}-${pkgver}/"
    make build
}

check() {
    cd "${srcdir}/${ghpkgname}-${pkgver}/"
    [ -f ./clibasic ]
}

package() {
    cd "${srcdir}/${ghpkgname}-${pkgver}/"
    install -Dm755 clibasic -t "${pkgdir}/usr/bin/"
}


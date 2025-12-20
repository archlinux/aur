# Maintainer: Perttu Luukko (firstname at lastname dot fi)
pkgname=jump
pkgver=0.67.0
pkgrel=1
pkgdesc="Quick and fuzzy directory jumper"
arch=("i686" "x86_64")
url="https://github.com/gsamokovarov/jump"
license=("MIT")
depends=("glibc")
makedepends=("go")
conflicts=("jump-git")
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/gsamokovarov/jump/archive/v${pkgver}.tar.gz")
sha256sums=('b54bc4d1173be7ad5e4866f3b76f02c59506cc66b05fafe4aa3854cad1d2d531')

build() {
    cd "$srcdir/jump-${pkgver}"
    go build
}

package() {
    cd "$srcdir/jump-${pkgver}"
    install -Dm755 jump "${pkgdir}/usr/bin/jump"
    install -Dm644 man/jump.1 "${pkgdir}/usr/share/man/man1/jump.1"
    install -Dm644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

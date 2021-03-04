# Maintainer: Perttu Luukko (firstname at lastname dot fi)
pkgname=jump
pkgver=0.40.0
pkgrel=1
pkgdesc="Quick and fuzzy directory jumper"
arch=("i686" "x86_64")
url="https://github.com/gsamokovarov/jump"
license=("MIT")
depends=("glibc")
makedepends=("go")
conflicts=("jump-git")
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/gsamokovarov/jump/archive/v${pkgver}.tar.gz")
sha256sums=('f005f843fc65b7be1d4159da7d4c220eef0229ecec9935c6ac23e4963eef645e')

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

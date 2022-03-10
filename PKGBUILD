# Maintainer: Perttu Luukko (firstname at lastname dot fi)
pkgname=jump
pkgver=0.41.0
pkgrel=1
pkgdesc="Quick and fuzzy directory jumper"
arch=("i686" "x86_64")
url="https://github.com/gsamokovarov/jump"
license=("MIT")
depends=("glibc")
makedepends=("go")
conflicts=("jump-git")
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/gsamokovarov/jump/archive/v${pkgver}.tar.gz")
sha256sums=('833151da3e9dc09190588c0a381116e3dfdf5b728869cb7b96681eb59c452b4c')

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

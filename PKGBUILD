# Maintainer: Perttu Luukko (firstname at lastname dot fi)
pkgname=jump
pkgver=0.51.0
pkgrel=1
pkgdesc="Quick and fuzzy directory jumper"
arch=("i686" "x86_64")
url="https://github.com/gsamokovarov/jump"
license=("MIT")
depends=("glibc")
makedepends=("go")
conflicts=("jump-git")
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/gsamokovarov/jump/archive/v${pkgver}.tar.gz")
sha256sums=('ce297cada71e1dca33cd7759e55b28518d2bf317cdced1f3b3f79f40fa1958b5')

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

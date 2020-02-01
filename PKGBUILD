# Maintainer: Perttu Luukko (firstname at lastname dot fi)
pkgname=jump
pkgver=0.30.1
pkgrel=1
pkgdesc="Quick and fuzzy directory jumper"
arch=("i686" "x86_64")
url="https://github.com/gsamokovarov/jump"
license=("MIT")
depends=("glibc")
makedepends=("go")
conflicts=("jump-git")
source=("https://github.com/gsamokovarov/jump/archive/v${pkgver}.tar.gz")
sha256sums=('76d6453246c047b49e669499dc1b6a7e4c4520653627461d84ad40c6afb45562')

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

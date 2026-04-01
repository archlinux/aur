# Maintainer: Rithwik A. Agarwal <rithwik.a.agarwal2006@gmail.com>
pkgname=stone-paper-scissors
pkgver=1.0.0
pkgrel=1
pkgdesc="A classic command-line Stone-Paper-Scissors game against a computer"
arch=('x86_64')
url="https://github.com/Rithwik-7274/Stone-Paper-Scissors-Game"
license=('GPL3')
depends=('figlet')
makedepends=('gcc' 'make')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/Rithwik-7274/Stone-Paper-Scissors-Game/archive/refs/tags/v1.0.0.tar.gz")
sha256sums=('1ccc1316dded2f0dac179b412775c22aefa138f4e75a57ebae0e5bc23de1c78c')

build() {
    cd "$srcdir/Stone-Paper-Scissors-Game-$pkgver"
    make
}

package() {
    cd "$srcdir/Stone-Paper-Scissors-Game-$pkgver"

    install -d "$pkgdir/usr/bin"
    install -m755 stone-paper-scissors "$pkgdir/usr/bin/stone-paper-scissors"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}

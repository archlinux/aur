# Maintainer: Stephan Springer <buzo+arch@Lini.de>

pkgname=pcmemtest
pkgver=1.5
pkgrel=1
pkgdesc='Stand-alone memory tester for x86 and x86-64 architecture computers'
arch=('x86_64')
url=https://github.com/martinwhitaker/pcmemtest
license=('GPL2')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('6c47972b94b6f5078341e5b8622ab3ce0e499515629480a2c8daf65e4547d65e')

build() {
    cd "$pkgname-$pkgver"/build64
    make
}

package() {
    cd "$pkgname-$pkgver"/build64
    install -Dm644 -t "$pkgdir"/boot memtest.{bin,efi}
}

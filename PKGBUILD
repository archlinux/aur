# Maintainer: arthur <mr.x-important@gmx.de>
pkgname=tutel
pkgver=0.2.10
pkgrel=1
epoch=1
pkgdesc="a minimalistic todo app for terminal enthusiasts"
url="https://www.github.com/0x5a4/tutel"
license=("MIT")
arch=("x86_64" "i686")
depends=()
makedepends=('cargo')
source=("${pkgname}::git+https://github.com/0x5a4/tutel.git#tag=v${pkgver}")
md5sums=('SKIP')

build() {
    cd $pkgname
    cargo b --release
}

package() {
    cd $pkgname/target/release
    install -Dm755 tutel -t "$pkgdir/usr/bin"
}

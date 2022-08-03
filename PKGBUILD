# Maintainer: arthur <mr.x-important@gmx.de>
pkgname=tutel
pkgver=0.2.5
pkgrel=1
epoch=1
pkgdesc="a minimalistic todo app for terminal enthusiasts"
url="https://www.github.com/InvalidName662/tutel"
license=("MIT")
arch=("x86_64" "i686")
depends=()
makedepends=('cargo' 'git')
source=("${pkgname}::git+https://github.com/InvalidName662/tutel.git#tag=v${pkgver}")
md5sums=('SKIP')

build() {
    cd $pkgname
    cargo b --release
}

package() {
    cd $pkgname/target/release
    install -Dm755 tutel -t "$pkgdir/usr/bin"
}

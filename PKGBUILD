# Maintainer Tait Hoyem <tait+ygg_aur@tait.tech>

pkgname=yggdrasil-sr
pkgver=0.1b
pkgrel=1
pkgdesc="Yggdrasil Screenreader -- Make Linux Accessible!"
url="https://yggdrasil-sr.github.io/"
license=('GPL3')
arch=('x86_64' 'aarch64')
depends=(
   clang rustup
)
provides=( yggdrasil-sr )

prepare() {
    rm -rf $srcdir/yggdrasil-prototype &2>/dev/null
    git clone https://github.com/yggdrasil-sr/yggdrasil-prototype
}

build() {
    cd $srcdir/yggdrasil-prototype
    cargo build
}

package() {
    mkdir -p $pkgdir/usr/bin/
    install -m 755 $srcdir/yggdrasil-prototype/target/debug/yggdrasil-prototype $pkgdir/usr/bin/yggdrasil-sr
}

#vim: syntax=sh


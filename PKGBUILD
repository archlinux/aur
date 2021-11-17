# Maintainer Tait Hoyem <tait+ygg_aur@tait.tech>

pkgname=odilia
pkgver=0.1b
pkgrel=1
pkgdesc="Odilia Screenreader -- Make Linux Accessible!"
url="https://yggdrasil-sr.github.io/"
license=('GPL3')
arch=('x86_64' 'aarch64')
depends=(
   clang rustup
)
provides=( odilia )

prepare() {
    rm -rf $srcdir/odilia-prototype &2>/dev/null
    git clone https://github.com/yggdrasil-sr/odilia-prototype
}

build() {
    cd $srcdir/odilia-prototype
    cargo build
}

package() {
    mkdir -p $pkgdir/usr/bin/
    install -m 755 $srcdir/odilia-prototype/target/debug/odilia-prototype $pkgdir/usr/bin/odilia
}

#vim: syntax=sh


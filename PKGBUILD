# Maintainer: Zakhar Smokotov <zaharb840@gmail.com>
pkgname=feb
pkgver=1.0
pkgrel=1
pkgdesc="easy to understand, simple to use suckless-style build system"
arch=('x86_64')
url="https://github.com/predefine/feb"
license=('CC0-1.0')
depends=()
makedepends=('git' 'base-devel' 'bash')
source=("git+$url")
md5sums=('SKIP')

build() {
    cd "$srcdir/$pkgname"
    git submodule update --init --recursive
    bash bootstrap.sh
}

package() {
    cd "$srcdir/$pkgname"
    install -Dm755 feb "$pkgdir/usr/bin/feb"
}

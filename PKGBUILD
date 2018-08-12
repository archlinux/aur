# Maintainer: Zhustec <zhustec@foxmail.com>

pkgname=erlang-lhttpc
_pkgname="${pkgname/erlang-/}"
pkgver=1.5.5
pkgrel=1
pkgdesc="Lightweight HTTP Client"
arch=("x86_64")
url=https://hex.pm/packages/lhttpc
license=("BSD")
depends=("erlang-nox")
makedepends=("rebar")
source=("https://repo.hex.pm/tarballs/$_pkgname-$pkgver.tar")
sha256sums=("0dda026c9c3860ef9015196add32c85c74fdfc8547df5e3dcdf827af555fcda6")

build() {
    cd "$srcdir" && tar xvaf contents.tar.gz
    rebar compile
}
    
package() {
    cd "$srcdir"
    mkdir -p "$pkgdir/usr/lib/erlang/lib/$_pkgname-$pkgver"

    for i in ebin include src; do
        cp -R $i "$pkgdir/usr/lib/erlang/lib/$_pkgname-$pkgver"
    done
}

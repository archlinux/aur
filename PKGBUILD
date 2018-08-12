# Maintainer: Zhustec <zhustec@foxmail.com>

pkgname=erlang-cowlib
_pkgname="${pkgname/erlang-/}"
pkgver=2.5.0
pkgrel=1
pkgdesc="Support library for manipulating Web protocols"
arch=("x86_64")
url=https://hex.pm/packages/cowlib
license=("ISC")
depends=("erlang-nox")
source=("https://repo.hex.pm/tarballs/$_pkgname-$pkgver.tar")
sha256sums=("da4976730819605a13f36a8feab74e50e31510eda022a10abb8ae298114ea5d2")

build() {
    cd "$srcdir" && tar xvaf contents.tar.gz
    make
}
    
package() {
    cd "$srcdir"
    mkdir -p "$pkgdir/usr/lib/erlang/lib/$_pkgname-$pkgver"

    for i in ebin include src; do
        cp -R $i "$pkgdir/usr/lib/erlang/lib/$_pkgname-$pkgver"
    done

    install -Dm644 ./LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

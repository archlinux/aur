# Maintainer: Zhustec <zhustec@foxmail.com>

pkgname=erlang-ranch
_pkgname="${pkgname/erlang-/}"
pkgver=1.6.0
pkgrel=1
pkgdesc="Socket acceptor pool for TCP protocols."
arch=("x86_64")
url=https://hex.pm/packages/ranch
license=("ISC")
depends=("erlang-nox")
source=("https://repo.hex.pm/tarballs/$_pkgname-$pkgver.tar")
sha256sums=("eb6170a697659046f517ceef15e568993d314591f05e73611e05605d4ac937f7")

build() {
    cd "$srcdir" && tar xvaf contents.tar.gz
    make
}
    
package() {
    cd "$srcdir"
    mkdir -p "$pkgdir/usr/lib/erlang/lib/$_pkgname-$pkgver"

    for i in ebin src; do
        cp -R $i "$pkgdir/usr/lib/erlang/lib/$_pkgname-$pkgver"
    done

    install -Dm644 ./LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

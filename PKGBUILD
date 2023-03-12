# Maintainer: Adrián Arroyo Calle <adrian.arroyocalle@gmail.com>

_commit="4b09e83ace43d3288046871028b94bf7248838c6"
pkgname=binprolog
pkgver=0.1.0
pkgrel=1
pkgdesc="Fast, simplified WAM-based Prolog system"
arch=('x86_64')
url="https://github.com/ptarau/binprolog"
license=('Apache-2.0')
depends=()
makedepends=('gcc' 'make')
source=("https://github.com/ptarau/binprolog/archive/$_commit.zip")
sha256sums=('8516529c133d331326a1753d6bc95c55605ded9c8e24d213f302d5f77ef806c3')

build() {
    cd "$srcdir/$pkgname-$_commit"
    make <<EOF
EOF
}

package() {
    cd "$srcdir/$pkgname-$_commit"
    mkdir -p "$pkgdir/usr/bin"
    install -Dm755 bin/bp -t "$pkgdir"/usr/bin
}

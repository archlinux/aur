# Maintainer: Chipster Julien <julien dot chipster @ archlinux dot fr>

pkgname=genhupo
pkgver=0.0.1
pkgrel=1
pkgdesc="Create ramdom file with lipsum for hugo"
arch=('any')
url="https://github.com/Chipsterjulien/genhupo"
license=('WTFPL')
makedepends=('go')
options=('!strip')
source=("$pkgname-$pkgver.tar.gz")

_builddir="$pkgname-$pkgver"

build() {
    cd "$_builddir"
    
    go build || return 1
}

package() {
    cd "$_builddir"

    # pingormail binary
    install -m755 -o root -g root -D "$srcdir"/$pkgname-$pkgver/$pkgname-$pkgver \
        "$pkgdir"/usr/bin/$pkgname || return 1
}

sha512sums=('7075c9179b84c3f86f8adc5393587210dd273e14447b8098ed2e07752be1c54d1e5eaace404d9d60f1df2996b0fa3ecc63a8daaf93659d71e92edb1fdc650869')

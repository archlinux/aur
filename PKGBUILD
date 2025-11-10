# Maintainer: augustus-7613 <augustus7613.mail@pm.me>
pkgname=fixname
pkgver=1.0.0
pkgrel=1
pkgdesc="Small utility to rename files by truncating everything after '?'"
arch=('x86_64')
url="https://github.com/augustus-7613/fixname"
license=('GPL3')
source=("$url/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('15bce1a2c792b9cc064d1c35a883632d34b609fd14c2686ebd7b341379efb071')
options=('!debug')

build() {
    cd "$srcdir/${pkgname}-${pkgver}"
    gcc -O2 -Wall -o fixname main.c
}

package() {
    cd "$srcdir/${pkgname}-${pkgver}"
    install -Dm755 fixname "$pkgdir/usr/bin/fixname"
}

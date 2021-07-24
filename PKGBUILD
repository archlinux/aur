#!/bin/bash

# Maintainer: PumpkinCheshire <me at pumpkincheshire dot top>

pkgname=lighter
_name=Lighter
pkgver=1.1.2
pkgrel=1
pkgdesc='Fast and memory-efficient sequencing error corrector'
url='https://github.com/mourisl/Lighter'
arch=('any')
license=('GPL3')
depends=('zlib')
makedepends=(
    'cmake'
    'gcc'
)
provides=("lighter")
conflicts=("lighter-git")
source=("$url/archive/refs/tags/v$pkgver.tar.gz")
b2sums=('6249e849d83e304969f010f0438f3e9252c92d5f53f8b228ca61465faa8182f5e4a4f3aac66ce9e234f51dc9fdd60518c37e042b08411e41a7b0591af4ae3bbc')

build() {
    cd "$srcdir/$_name-$pkgver/" || exit
    make
}

package() {
    install -Dm755 "$srcdir/$_name-$pkgver/$pkgname" "$pkgdir/usr/bin/$pkgname"
    install -Dm644 "$srcdir/$_name-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

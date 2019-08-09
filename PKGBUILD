#!/bin/bash
# File              : PKGBUILD
# Author            : Flori4nK <contact@flori4nk.de>
# Date              : 09.08.2019
# Last Modified Date: 09.08.2019
# Maintainer: Flori4nK <contact@flori4nk.de>
pkgname="get-binary-git"
url="https://gitlab.com/flori4nk/get-binary"
pkgver=1.2.4
pkgrel=1
pkgdesc="A text to binary converter"
arch=("x86_64")
license=('MIT')
source=("https://gitlab.com/flori4nk/get-binary/-/archive/v$pkgver/get-binary-v$pkgver.tar.gz")
sha256sums=("92ce2b71d049f9b2917ad8e216f1384357cb2e7abe6ac340ce3c3bfb093b5fea")

build() {
    cd "get-binary-v$pkgver"
    make
}

package() {
    cd "get-binary-v$pkgver/build"
    install -dm755 "$pkgdir/usr/bin"  
    cp "get-binary" "$pkgdir/usr/bin/get-binary"   
}

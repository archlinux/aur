#!/bin/bash

# Maintainer: PumpkinCheshire <me at pumpkincheshire dot com>

pkgname=cockpit-navigator
pkgver=0.5.8
pkgrel=1
pkgdesc='A Featureful File Browser for Cockpit.'
url="https://github.com/45Drives/cockpit-navigator"
arch=('x86_64')
license=('GPL')
depends=('cockpit' 'python' 'rsync' 'zip')
source=("$url/archive/refs/tags/v$pkgver.tar.gz"
    "$url/releases/download/v$pkgver/LICENSE")
b2sums=('2aac5d2880eea66a753f7a5ad3921bf54a3217b8b5396d8ca7b0eadfd8396a58fc45584164e2f444c996a41f062ff9f84e6d5442a9ae726702cb6932810ee8dd'
        '74915e048cf8b5207abf603136e7d5fcf5b8ad512cce78a2ebe3c88fc3150155893bf9824e6ed6a86414bbe4511a6bd4a42e8ec643c63353dc8eea4a44a021cd')

package() {
    cd "$srcdir/$pkgname-$pkgver" || exit
    make DESTDIR="$pkgdir" NAV_VERS=$pkgver install
    install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}

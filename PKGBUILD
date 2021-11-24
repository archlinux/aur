#!/bin/bash

# Maintainer: PumpkinCheshire <me at pumpkincheshire dot com>

pkgname=cockpit-navigator
pkgver=0.5.6
pkgrel=1
pkgdesc='A Featureful File Browser for Cockpit.'
url="https://github.com/45Drives/cockpit-navigator"
arch=('x86_64')
license=('GPL')
depends=('cockpit' 'python' 'rsync' 'zip')
source=("$url/archive/refs/tags/v$pkgver.tar.gz"
    "$url/releases/download/v$pkgver/LICENSE")
b2sums=('79714a54b75e95a243a58071cd3456cc3ef07f48f7752907d290c2e1f033425588df4c2a7a0afd2b42faf1b01aaf96b9e0f06b5049e1607aeceacbaf80406702'
        '74915e048cf8b5207abf603136e7d5fcf5b8ad512cce78a2ebe3c88fc3150155893bf9824e6ed6a86414bbe4511a6bd4a42e8ec643c63353dc8eea4a44a021cd')

package() {
    cd "$srcdir/$pkgname-$pkgver" || exit
    make DESTDIR="$pkgdir" NAV_VERS=$pkgver install
    install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}

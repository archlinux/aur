# Maintainer: Jonas Frei <freijon@gmail.com>

pkgname=memefs
pkgver=0.1.0
pkgrel=1
pkgdesc="A filesystem for your memes"
arch=('x86_64')
url="https://github.com/svenstaro/memefs"
license=('MIT')
depends=('fuse2')
makedepends=('cargo')
source=("memefs-${pkgver}.tar.gz::https://codeload.github.com/svenstaro/memefs/tar.gz/${pkgver}")
sha512sums=('84b7ae2f898945738be8164f3a88852ec9373f3b1cd7ed259b2ec7d023d5e8fbff02c3137aaed1b967ec81ba89bfc44a6e52d562d5015d914023ed66ebe62a02')
provides=('memefs')

build() {
	cd $srcdir/$pkgname-$pkgver
	cargo build --release
}

package() {
	install -Dv $srcdir/$pkgname-$pkgver/target/release/memefs $pkgdir/usr/bin/memefs
}

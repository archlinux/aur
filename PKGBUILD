# Maintainer: Simon Repp <simon@fdpl.io>

arch=('x86_64')
depends=('ffmpeg' 'rsync')
license=('AGPL3')
makedepends=('cmake' 'git' 'rust')
options=('!lto')
pkgdesc='A static site generator for video publishing'
pkgname=hyper8
pkgrel=1
pkgver=0.19.0
sha256sums=('1fb316ce222badd915092ba3bfaa56033e7766632aeaee2b44c6ac90a9637e74')
url='https://simonrepp.com/hyper8'

source=("${pkgname}-${pkgver}.tar.gz::https://codeberg.org/simonrepp/hyper8/archive/${pkgver}.tar.gz")

build() {
	cd "$srcdir/$pkgname"
	cargo build --locked --release
}

package() {
	mkdir -p "$pkgdir/usr/bin"
	install -Dm755 "$srcdir/$pkgname/target/release/hyper8" "$pkgdir/usr/bin/hyper8"
}

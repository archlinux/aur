# Maintainer: Simon Repp <simon@fdpl.io>

arch=('x86_64')
depends=('ffmpeg' 'rsync')
license=('AGPL3')
makedepends=('cmake' 'git' 'rust')
options=('!lto')
pkgdesc='A static site generator for video publishing'
pkgname=hyper8
pkgrel=1
pkgver=0.22.0
sha256sums=('8942daeb354b4c76feaec771a4d8c671ecdd92730d9854b0638d0a7151a657a0')
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

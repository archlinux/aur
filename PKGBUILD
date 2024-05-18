# Maintainer: Simon Repp <simon@fdpl.io>

arch=('x86_64')
depends=('ffmpeg' 'rsync')
license=('AGPL3')
makedepends=('cmake' 'git' 'rust')
md5sums=('c2523c5dca9eff886b796b318b5e1329')
options=('!lto')
pkgdesc='A static site generator for video'
pkgname=hyper8
pkgrel=1
pkgver=0.12.0
url='https://simonrepp.com/hyper8'

source=("${pkgname}-${pkgver}.tar.gz::https://codeberg.org/simonrepp/hyper8/archive/${pkgver}.tar.gz")

build() {
	cd "$srcdir/$pkgname"
	cargo build --release
}

package() {
	mkdir -p "$pkgdir/usr/bin"
	install -Dm755 "$srcdir/$pkgname/target/release/hyper8" "$pkgdir/usr/bin/hyper8"
}

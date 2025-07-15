# Maintainer: Simon Repp <simon@fdpl.io>

arch=('x86_64')
depends=('ffmpeg' 'rsync')
license=('AGPL3')
makedepends=('cmake' 'git' 'rust')
options=('!lto')
pkgdesc='A static site generator for video publishing'
pkgname=hyper8
pkgrel=1
pkgver=0.21.0
sha256sums=('7d257fa0be866f5247d110d57e99208b4b10e261620408b7ef78447c7519e985')
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

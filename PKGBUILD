# Maintainer: Geoffrey D. Bennett <g@b4.vu>
pkgname=scarlett2
pkgver=1.0
pkgrel=1
pkgdesc='CLI tool for Focusrite Scarlett/Clarett/Vocaster audio interfaces'
arch=('x86_64')
url="https://github.com/geoffreybennett/$pkgname"
license=('GPL3')
depends=('alsa-lib' 'openssl')
makedepends=('make' 'gcc')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('SKIP')

build() {
  cd "$pkgname-$pkgver"
  make PREFIX=/usr
}

package() {
  cd "$pkgname-$pkgver"
  make PREFIX=/usr DESTDIR="$pkgdir" install
}

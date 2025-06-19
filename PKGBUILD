# Maintainer: graysky <therealgraysky AT protonmail DOT com>

pkgname=clean-chroot-manager
pkgver=2.240
pkgrel=1
pkgdesc='Wrapper for managing clean chroot builds with local repo therein.'
arch=(any)
url='https://github.com/graysky2/clean-chroot-manager'
license=(MIT)
depends=('devtools>=1:1.0.0-1' rsync 'libarchive>=3.3.3' 'pacman>=7.0.0-1' bc)
source=("$pkgname-$pkgver.tar.gz::https://github.com/graysky2/clean-chroot-manager/archive/v$pkgver.tar.gz")
b2sums=('94f25860f727ec1a34d7c64b0422ed582b356f8fb886adc3b68ac9810179faade028dd473e3297d849680552beb6a312fd90306c317dbbd3ae1a95c0630cfb2f')
install=ccm.install

build() {
  cd "$pkgname-$pkgver"
  make
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
  install -Dm644 MIT "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

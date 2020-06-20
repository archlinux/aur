# Maintainer: 0x9fff00 <0x9fff00+git@protonmail.ch>
# Contributor: Ivan Shapovalov <intelfx@intelfx.name>
# Contributor: Matthew Bauer <mjbauer95@gmail.com>

pkgname=libirecovery
pkgver=1.0.0
pkgrel=1
pkgdesc="Library and utility to talk to iBoot/iBSS via USB"
arch=('x86_64')
url="https://www.libimobiledevice.org/"
license=('LGPL2.1')
depends=('libusb' 'readline')
source=("https://www.libimobiledevice.org/downloads/$pkgname-$pkgver.tar.bz2")
sha256sums=('cda0aba10a5b6fc2e1d83946b009e3e64d0be36912a986e35ad6d34b504ad9b4')

build() {
  cd "$pkgname-$pkgver"

  ./configure --prefix=/usr
  make
}

package() {
  cd "$pkgname-$pkgver"

  make DESTDIR="$pkgdir" install
}

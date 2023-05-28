# Maintainer: 0x9fff00 <0x9fff00+git@protonmail.ch>
# Contributor: Frederik Schwan <freswa at archlinux dot org>

pkgname=libimobiledevice-glue
pkgver=1.0.0
pkgrel=1
pkgdesc='Library with common code used by the libraries and tools around the libimobiledevice project'
arch=('x86_64')
url='https://libimobiledevice.org/'
license=('LGPL2.1')
depends=('libplist')
source=("https://github.com/libimobiledevice/$pkgname/releases/download/$pkgver/$pkgname-$pkgver.tar.bz2")
sha256sums=('160a70e2edc318312fc40b6a71f85bfdfabdfba10bcfc5bb6fb40ed95088f4a0')

build() {
  cd "$pkgname-$pkgver"

  ./configure --prefix=/usr
  make
}

package() {
  cd "$pkgname-$pkgver"

  make DESTDIR="$pkgdir" install
}

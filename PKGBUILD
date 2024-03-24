# Maintainer: 0x9fff00 <0x9fff00+git@protonmail.ch>
# Contributor: Frederik Schwan <freswa at archlinux dot org>

pkgname=libimobiledevice-glue
pkgver=1.2.0
pkgrel=1
pkgdesc='Library with common code used by the libraries and tools around the libimobiledevice project'
arch=('x86_64')
url='https://libimobiledevice.org/'
license=('LGPL-2.1-or-later')
depends=('libplist')
source=("https://github.com/libimobiledevice/$pkgname/releases/download/$pkgver/$pkgname-$pkgver.tar.bz2")
sha256sums=('ff9cbc240c9780edfa43914a057b86362054053721b65fb04f54a25023b92b62')

build() {
  cd "$pkgname-$pkgver"

  ./configure --prefix=/usr
  make
}

package() {
  cd "$pkgname-$pkgver"

  make DESTDIR="$pkgdir" install
}

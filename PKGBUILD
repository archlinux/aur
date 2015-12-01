# Maintainer: Mattias Andrée <`base64 -d`(bWFhbmRyZWUK)@member.fsf.org>

pkgname=relink
pkgver=1.2
pkgrel=1
pkgdesc="A simple utility that modifies your symlinks"
arch=(any)
url="https://github.com/maandree/relink"
license=('GPL3')
depends=(python3 argparser coreutils)
makedepends=(make coreutils texinfo auto-auto-complete)
install=relink.install
source=($url/archive/$pkgver.tar.gz)
sha256sums=(c1b8e6a5c3468a8ff80593f131f834ce5dd5914676a88a0c1b84a8a50d92b540)


build() {
  cd "$srcdir/$pkgname-$pkgver"
  make PREFIX=/usr
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make PREFIX=/usr DESTDIR="$pkgdir" install
}


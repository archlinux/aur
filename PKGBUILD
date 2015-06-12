# Maintainer: Mattias Andrée <`base64 -d`(bWFhbmRyZWUK)@member.fsf.org>

pkgname=relink
pkgver=1.1
pkgrel=1
pkgdesc="A simple utility that modifies your symlinks"
arch=(any)
url="https://github.com/maandree/relink"
license=('GPL3')
depends=(python3 argparser coreutils)
makedepends=(make coreutils texinfo auto-auto-complete)
install=relink.install
source=($url/archive/$pkgver.tar.gz)
sha256sums=(45def302c0fe2e0d7376b519faacefc67c75feb10b694613cf38d784af1328fa)


build() {
  cd "$srcdir/$pkgname-$pkgver"
  make PREFIX=/usr
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make PREFIX=/usr DESTDIR="$pkgdir" install
}


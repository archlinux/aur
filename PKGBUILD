# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=multicat
pkgver=2.3
pkgrel=2
pkgdesc="Easily and efficiently manipulate multicast streams"
arch=('i686' 'x86_64')
url="https://www.videolan.org/projects/multicat.html"
license=('GPL2')
depends=('glibc')
makedepends=('bitstream')
source=("$pkgname-$pkgver-src.tar.bz2::https://get.videolan.org/multicat/$pkgver/multicat-$pkgver.tar.bz2")
sha256sums=('2be162e9e8b2e6f6aa7686431f102db6c72c8288bd82dbc67ffed631f4a3361e')


build() {
  cd "$pkgname-$pkgver"

  make
}

package() {
  cd "$pkgname-$pkgver"

  make DESTDIR="$pkgdir" PREFIX="/usr" install
}

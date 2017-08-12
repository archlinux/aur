# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=multicat
pkgver=2.2
pkgrel=1
pkgdesc="Easily and efficiently manipulate multicast streams"
arch=('i686' 'x86_64')
url="https://www.videolan.org/projects/multicat.html"
license=('GPL2')
depends=('glibc')
makedepends=('bitstream')
source=("$pkgname-$pkgver-src.tar.gz::https://get.videolan.org/multicat/$pkgver/multicat-$pkgver.tar.bz2")
sha256sums=('fa4e48b38665658df7719293f9358df08f59f3eb7f7b77df510b35951e316b40')


build() {
  cd "$pkgname-$pkgver"

  make
}

package() {
  cd "$pkgname-$pkgver"

  make DESTDIR="$pkgdir" PREFIX="/usr" install
}

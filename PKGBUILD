# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=multicat
pkgver=2.4
pkgrel=1
pkgdesc="Easily and efficiently manipulate multicast streams"
arch=('i686' 'x86_64')
url="https://www.videolan.org/projects/multicat.html"
license=('GPL-2.0-or-later')
depends=('glibc')
makedepends=('bitstream')
source=("$pkgname-$pkgver-src.tar.bz2::https://get.videolan.org/multicat/$pkgver/multicat-$pkgver.tar.bz2")
sha256sums=('59d91045965104a882aaa7e96a4b23c56b4017f49de6883722039f3a9d31e9d9')


build() {
  cd "$pkgname-$pkgver"

  make
}

package() {
  cd "$pkgname-$pkgver"

  make DESTDIR="$pkgdir" PREFIX="/usr" install
}

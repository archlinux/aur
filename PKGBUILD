# Maintainer: Alexander Nicholi <me@nicholatian.com>
pkgname=grit
pkgver=0.8.16
pkgrel=1
epoch=
pkgdesc='Game Raster Image Transmogrifier'
arch=('i686' 'x86_64')
url="https://github.com/devkitPro/$pkgname"
license=('GPL-2.0')
depends=()
makedepends=('git')
provides=("$pkgname")
conflicts=("$pkgname")
source=("https://github.com/devkitPro/$pkgname/releases/download/v$pkgver/$pkgname-$pkgver.tar.bz2")
sha1sums=('f099d711e8e8d61e90078050099e61a9f691d046')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  ./configure
  make -j$(($(nproc) * 2))
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  install -Dsm755 "$srcdir/$pkgname-$pkgver/$pkgname" "$pkgdir/usr/bin/$pkgname"
}

# Maintainer: Alexander Nicholi <me@nicholatian.com>
pkgname=gbafix
pkgver=1.2.0
pkgrel=1
epoch=
pkgdesc="Fix GBA ROM file headers."
arch=('i686' 'x86_64')
url="https://github.com/devkitPro/gba-tools"
license=('GPL-2.0')
depends=()
makedepends=('git')
provides=("$pkgname")
conflicts=("$pkgname")
source=('https://github.com/devkitPro/gba-tools/releases/download/v1.2.0/gba-tools-1.2.0.tar.bz2')
sha1sums=('aad9a673b4578ad8617a5e8397266ee9028a0d42')

build() {
  cd "$srcdir/gba-tools-$pkgver"

  ./configure
  make -j$(($(nproc) * 2))
}

package() {
  cd "$srcdir/gba-tools-$pkgver"

  install -Dsm755 "$srcdir/gba-tools-$pkgver/$pkgname" "$pkgdir/usr/bin/$pkgname"
}

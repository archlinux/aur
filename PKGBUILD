# Maintainer: Rafael Silva <perigoso@riseup.net>

pkgname=ft9xx-libc
pkgver=2.5.0
pkgrel=1
pkgdesc='C register and peripheral library for the FT9XX family of microcontrollers'
arch=(any)
url='https://brtchip.com/ft9xx-toolchain/'
license=(custom)
depends=(ft32-elf-gcc)
options=(!strip)
source=("https://github.com/perigoso/ft9xx-libc/archive/refs/tags/$pkgver.tar.gz")
sha1sums=('23b627691d2261cea05e7a168338819187457de8')

build() {
  cd $pkgname-$pkgver
}

package() {
  cd $pkgname-$pkgver

  mkdir -p "$pkgdir/usr/ft32-elf/lib" "$pkgdir/usr/ft32-elf/include/ft9xx/private" "$pkgdir/usr/ft32-elf/include/ft9xx/registers"

  cp -r --no-preserve=ownership lib/* "$pkgdir/usr/ft32-elf/lib"
  cp -r --no-preserve=ownership include/* "$pkgdir/usr/ft32-elf/include/ft9xx"

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

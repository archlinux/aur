# Maintainer: Thomas Aunvik <contact@thaun.dev>
pkgname=ninjarmm-ncplayer
pkgver=16.58.9230
_filever=16.58.9230
pkgrel=1
pkgdesc="Fast, reliable, single-click remote access. Manage and control Windows, Mac, and Linux endpoints with one click from the NinjaOne console."
arch=('x86_64' 'aarch64')
url='https://www.ninjaone.com'
license=('custom')

depends=()

source_x86_64=(https://resources.ninjarmm.com/development/ninjacontrol/${_filever}/ninjarmm-ncplayer-${_filever}_x86_64.rpm)
sha256sums_x86_64=('bcffa656295f447fa64563a58a5e4a381bc97ad491bea9321dcd6cfa8b49e65a')

source_aarch64=(https://resources.ninjarmm.com/development/ninjacontrol/${_filever}/ninjarmm-ncplayer-${_filever}_aarch64.rpm)
sha256sums_aarch64=('2c3383923fcc60293f5eed64ddc65a7c899592a13cb03a874bee254edbfa0813')


package() {
  find $srcdir/ -mindepth 1 -maxdepth 1 -type d | xargs cp -r -t "$pkgdir"
  rm -r "$pkgdir/usr/lib/.build-id"
  rmdir "$pkgdir/usr/lib"

  install -Dm644 "$srcdir/usr/share/doc/ninjarmm-ncplayer/LICENSE.en.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
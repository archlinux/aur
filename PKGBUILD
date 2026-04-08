# Maintainer: Thomas Aunvik <contact@thaun.dev>
pkgname=ninjarmm-ncplayer
pkgver=13.35.8340
_filever=13.35.8340
pkgrel=1
pkgdesc="Fast, reliable, single-click remote access. Manage and control Windows, Mac, and Linux endpoints with one click from the NinjaOne console."
arch=('x86_64' 'aarch64')
url='https://www.ninjaone.com'
license=('custom')

depends=()

source_x86_64=(https://resources.ninjarmm.com/development/ninjacontrol/${_filever}/ninjarmm-ncplayer-${_filever}_x86_64.rpm)
sha256sums_x86_64=('40cbcffeb1a64301d988114c9e7cfad11ac81115a0bbb1c4e05f9e1ecb67a0fc')

source_aarch64=(https://resources.ninjarmm.com/development/ninjacontrol/${_filever}/ninjarmm-ncplayer-${_filever}_aarch64.rpm)
sha256sums_aarch64=('fb012b72a7e536a49f5c7d40fbccee01fa45466b8498bb5149a4d9e26d075ced')


package() {
  find $srcdir/ -mindepth 1 -maxdepth 1 -type d | xargs cp -r -t "$pkgdir"
  rm -r "$pkgdir/usr/lib/.build-id"
  rmdir "$pkgdir/usr/lib"

  install -Dm644 "$srcdir/usr/share/doc/ninjarmm-ncplayer/LICENSE.en.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
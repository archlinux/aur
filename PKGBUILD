# Maintainer: Thomas Aunvik <contact@thaun.dev>
pkgname=ninjarmm-ncplayer
pkgver=12.35.8100
_filever=12.35.8100
pkgrel=1
pkgdesc="Fast, reliable, single-click remote access. Manage and control Windows, Mac, and Linux endpoints with one click from the NinjaOne console."
arch=('x86_64' 'aarch64')
url='https://www.ninjaone.com'
license=('custom')

depends=()

source_x86_64=(https://resources.ninjarmm.com/development/ninjacontrol/${_filever}/ninjarmm-ncplayer-${_filever}_x86_64.rpm)
sha256sums_x86_64=('3681ad3000e22f2c598478ea66f9495e5e0ada0a2c471ef92e07c68a4a3cd5b1')

source_aarch64=(https://resources.ninjarmm.com/development/ninjacontrol/${_filever}/ninjarmm-ncplayer-${_filever}_aarch64.rpm)
sha256sums_aarch64=('a91532e2c225033e1613c118284f9c255f2ba206bb18190f81abac3feaffb11b')


package() {
  find $srcdir/ -mindepth 1 -maxdepth 1 -type d | xargs cp -r -t "$pkgdir"
  rm -r "$pkgdir/usr/lib/.build-id"
  rmdir "$pkgdir/usr/lib"

  install -Dm644 "$srcdir/usr/share/doc/ninjarmm-ncplayer/LICENSE.en.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
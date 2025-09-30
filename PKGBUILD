# Maintainer: Thomas Aunvik <contact@thaun.dev>
pkgname=ninjarmm-ncplayer
pkgver=6.35.7510
_filever=6.35.7510
pkgrel=3
pkgdesc="Fast, reliable, single-click remote access. Manage and control Windows, Mac, and Linux endpoints with one click from the NinjaOne console."
arch=('x86_64' 'aarch64')
url='https://www.ninjaone.com'
license=('custom')

depends=()

source_x86_64=(https://resources.ninjarmm.com/development/ninjacontrol/${_filever}/ninjarmm-ncplayer-${_filever}_x86_64.rpm)
sha256sums_x86_64=('118dd67ccc3d507d0397e4babb356616bf026c439393c3e42d8e7809523fa581')

source_aarch64=(https://resources.ninjarmm.com/development/ninjacontrol/${_filever}/ninjarmm-ncplayer-${_filever}_aarch64.rpm)
sha256sums_aarch64=('4defee8054a2b9fa0a21c33ce4373108ba8109b12c1f32c3d329e9fcc49ef887')


package() {
  find $srcdir/ -mindepth 1 -maxdepth 1 -type d | xargs cp -r -t "$pkgdir"
  rm -r "$pkgdir/usr/lib/.build-id"
  rmdir "$pkgdir/usr/lib"

  install -Dm644 "$srcdir/usr/share/doc/ninjarmm-ncplayer/LICENSE.en.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
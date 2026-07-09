# Maintainer: Thomas Aunvik <contact@thaun.dev>
pkgname=ninjarmm-ncplayer
pkgver=14.35.8480
_filever=14.35.8480
pkgrel=1
pkgdesc="Fast, reliable, single-click remote access. Manage and control Windows, Mac, and Linux endpoints with one click from the NinjaOne console."
arch=('x86_64' 'aarch64')
url='https://www.ninjaone.com'
license=('custom')

depends=()

source_x86_64=(https://resources.ninjarmm.com/development/ninjacontrol/${_filever}/ninjarmm-ncplayer-${_filever}_x86_64.rpm)
sha256sums_x86_64=('dc0385bbc538ecc4c750cf69ca2a3aaee25fe72c0199069d07a7d54bece37fb1')

source_aarch64=(https://resources.ninjarmm.com/development/ninjacontrol/${_filever}/ninjarmm-ncplayer-${_filever}_aarch64.rpm)
sha256sums_aarch64=('f6daa9d8216bf3ef4b75f1fffc20765a80cf088f07b7e7278acfcf2f6c0cef77')


package() {
  find $srcdir/ -mindepth 1 -maxdepth 1 -type d | xargs cp -r -t "$pkgdir"
  rm -r "$pkgdir/usr/lib/.build-id"
  rmdir "$pkgdir/usr/lib"

  install -Dm644 "$srcdir/usr/share/doc/ninjarmm-ncplayer/LICENSE.en.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
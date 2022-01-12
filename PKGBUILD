# Maintainer: Sam L. Yes
# Contributor: farwayer <farwayer@gmail.com>
# Contributor: Danct12 <danct12@disroot.org>
# Contributor: Bart Ribbers <bribbers@disroot.org>

_lineage_ver=18.1
_build=202111291420
pkgname=waydroid-image-dev
pkgver="${_lineage_ver}_${_build}"
pkgrel=1
pkgdesc="A container-based approach to boot a full Android system on a regular Linux system (Android 11 image from blissos-dev)."
arch=('x86_64')
license=('Apache')
url='https://sourceforge.net/projects/blissos-dev/'
depends=('waydroid')
provides=('waydroid-image')
conflicts=('waydroid-image')
source=("https://sourceforge.net/projects/blissos-dev/files/waydroid/lineage/lineage-$_lineage_ver/Lineage-OS-$_lineage_ver-waydroid_x86_64-$_build-foss-sd-hd-ex_ax86-vaapi_gles-aep.zip")
sha256sums=('f24a0804a5c8d40d65f772d7e0daed446974969e872ba03eb0cc49204d791665')

package() {
  install -d "$pkgdir/usr/share/waydroid-extra/images"
  mv $srcdir/{system,vendor}.img "$pkgdir/usr/share/waydroid-extra/images"
}

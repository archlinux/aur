# Maintainer: farwayer <farwayer@gmail.com>
# Co-maintainer: Markus Hartung (harre) <mail@hartmark.se>
# Contributer: Danct12 <danct12@disroot.org>
# Contributor: Bart Ribbers <bribbers@disroot.org>

_pkgver_images_system="20.0-20250809"
_pkgver_images_vendor="20.0-20250809"

_pkgver_images_system_x86="20.0-20250816"
_pkgver_images_vendor_x86="20.0-20250809"

_pkgver_images_system_arm64="20.0-20250809"
_pkgver_images_vendor_arm64="20.0-20250809"

_pkgver_images_system_arm="20.0-20250816"
_pkgver_images_vendor_arm="20.0-20250809"

pkgname=waydroid-image-gapps
pkgver="${_pkgver_images_system//-/_}"
pkgrel=1
pkgdesc="A container-based approach to boot a full Android system on a regular Linux system (Android image, GAPPS)."
arch=('x86_64' 'i686' 'armv7h' 'aarch64')
license=('Apache')
url='https://github.com/waydroid'
optdepends=('waydroid')
provides=('waydroid-image')
source_i686=(https://sourceforge.net/projects/waydroid/files/images/system/lineage/waydroid_x86/lineage-$_pkgver_images_system_x86-GAPPS-waydroid_x86-system.zip
  https://sourceforge.net/projects/waydroid/files/images/vendor/waydroid_x86/lineage-$_pkgver_images_vendor_x86-MAINLINE-waydroid_x86-vendor.zip)
source_x86_64=(https://sourceforge.net/projects/waydroid/files/images/system/lineage/waydroid_x86_64/lineage-$_pkgver_images_system-GAPPS-waydroid_x86_64-system.zip
  https://sourceforge.net/projects/waydroid/files/images/vendor/waydroid_x86_64/lineage-$_pkgver_images_vendor-MAINLINE-waydroid_x86_64-vendor.zip)
source_armv7h=(https://sourceforge.net/projects/waydroid/files/images/system/lineage/waydroid_arm/lineage-$_pkgver_images_system_arm-GAPPS-waydroid_arm-system.zip
  https://sourceforge.net/projects/waydroid/files/images/vendor/waydroid_arm/lineage-$_pkgver_images_vendor_arm-MAINLINE-waydroid_arm-vendor.zip)
source_aarch64=(https://sourceforge.net/projects/waydroid/files/images/system/lineage/waydroid_arm64/lineage-$_pkgver_images_system_arm64-GAPPS-waydroid_arm64-system.zip
  https://sourceforge.net/projects/waydroid/files/images/vendor/waydroid_arm64/lineage-$_pkgver_images_vendor_arm64-MAINLINE-waydroid_arm64-vendor.zip)

case "$CARCH" in
  aarch64) _imgarch="arm64" ;;
  armv7h) _imgarch="arm" ;;
  *) _imgarch="$CARCH" ;;
esac

package() {
  install -dm755 "$pkgdir/usr/share/waydroid-extra/images"

  # makepkg have extracted the zips
  mv "$srcdir/system.img" "$pkgdir/usr/share/waydroid-extra/images"
  mv "$srcdir/vendor.img" "$pkgdir/usr/share/waydroid-extra/images"
}

sha256sums_x86_64=('0c5ef97e6aafa44e1775dd553339bd49991c99c3989550cc74197d6de51f6c4e'
                   '14df3ffc773a30c2c157fa6f97e6c79338990b60ac85d69559bbfb82772650ef')
sha256sums_i686=('01ba907d45002e097991b5dfacdc6c4d3730456ee73b60186fe846827d6ef19e'
                 '77f5b7054f845c400246ad0b0764da3c6e4f87ade5abc040d81534eb9559f129')
sha256sums_armv7h=('ead29497276e61b1fc8155d26bc338580de92c714cea31a6f0e7f3838108c5e3'
                   '311cff66435a5c41ea208473a3ec668ec617042eda7a94899de9a26f301b0577')
sha256sums_aarch64=('cd0a67945e558e43e3d088e7f3f5d5d6faaad29efafc6790a9d852d8bb9b7cc1'
                    'da43b4a822d6951e2c6ee4c18e59ce2f44b505d70a0e942c3a99c9b39345e59c')

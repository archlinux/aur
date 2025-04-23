# Maintainer: farwayer <farwayer@gmail.com>
# Co-maintainer: Markus Hartung (harre) <mail@hartmark.se>
# Contributer: Danct12 <danct12@disroot.org>
# Contributor: Bart Ribbers <bribbers@disroot.org>

_pkgver_images_system="20-20250419"
_pkgver_images_vendor="20-20250419"

_pkgver_images_system_x86="20-20250421"
_pkgver_images_vendor_x86="20-20250421"

_pkgver_images_system_arm64="20-20250419"
_pkgver_images_vendor_arm64="20-20250419"

_pkgver_images_system_arm="20-20250419"
_pkgver_images_vendor_arm="20-20250419"

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

sha256sums_x86_64=('427cfa4cf23f781722f480355d59ee5e47f6684b9c40dec6ce0bc78052577c81'
                   'ef2ad338be986f6ec3d25feb40b61941725933482cff4fa96b6e66d1d9508554')
sha256sums_i686=('51bb478a4844f76d7983913ae5e3ed85c9073a4f5eda02e1739cb40c8d80e14c'
                 '9cb5a60d92cb246e81f1e5865ceb381c9d808d6a6c8fe2cef42b4c4aea7988f5')
sha256sums_armv7h=('6e4530ee505148aaa132d3fd51a01663463ef342af3f94771803c72ca85ffcb0'
                   '3480cde6113cf6f82e4c58756de132776cc5a786799e9d956a0967c88f70b900')
sha256sums_aarch64=('deccc98e2dc45135e3c18983605883edad5653c76750e04bfc31543a387cb8f1'
                    'dd0878460adca3b9a5624c7bf2972d5339ceea0bb720bbad6d5d0d9778fe0c9c')

# Maintainer: farwayer <farwayer@gmail.com>
# Co-maintainer: Markus Hartung (harre) <mail@hartmark.se>
# Contributer: Danct12 <danct12@disroot.org>
# Contributor: Bart Ribbers <bribbers@disroot.org>

_pkgver_images_system="20-20250426"
_pkgver_images_vendor="20-20250426"

_pkgver_images_system_x86="20-20250426"
_pkgver_images_vendor_x86="20-20250426"

_pkgver_images_system_arm64="20-20250426"
_pkgver_images_vendor_arm64="20-20250426"

_pkgver_images_system_arm="20-20250426"
_pkgver_images_vendor_arm="20-20250426"

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

sha256sums_x86_64=('a0f61e862807575572842f3336c462b5edc5841a324e8d7268c461900bf694b1'
                   'a0722fd522e83dac484db9b3f8e3636494064af95381d7901092bea20a87f152')
sha256sums_i686=('dafca52df313d5d307ce11a02710327913de7fc9287ea5f8788c0f8d88af1df8'
                 '14d73dd428eeb0b2f69c7cdf6f8e9d85111f1330394bcec7b2af6be041133d3b')
sha256sums_armv7h=('22df3a1d5dd55b00b628443b71b3340aa966495adf4bc3d6d1f916567c246ec9'
                   'abb36d5d587e2ca72b83e93fb48818be4209e4c850f7f8acd86e787978ea387a')
sha256sums_aarch64=('83c4469a2bf81cbd7867354cac1d89852c9af81e6200b4e0687b868256ac8f34'
                    '4db711d43ea9b389209c808464443fca8aca95f3ff546cfe8738d016aa83d689')

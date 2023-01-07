# Maintainer: farwayer <farwayer@gmail.com>
# Co-maintainer: Markus Hartung (harre) <mail@hartmark.se>
# Contributer: Danct12 <danct12@disroot.org>
# Contributor: Bart Ribbers <bribbers@disroot.org>

_pkgver_images_system="18.1-20221231"
_pkgver_images_vendor="18.1-20221231"

_pkgver_images_system_x86="18.1-20221231"
_pkgver_images_vendor_x86="18.1-20221231"

_pkgver_images_system_arm64="18.1-20221231"
_pkgver_images_vendor_arm64="18.1-20221231"

_pkgver_images_system_arm="18.1-20221231"
_pkgver_images_vendor_arm="18.1-20221231"

pkgname=waydroid-image-gapps
pkgver="${_pkgver_images_system//-/_}"
pkgrel=2
pkgdesc="A container-based approach to boot a full Android system on a regular Linux system (Android image, GAPPS)."
arch=('x86_64' 'i686' 'armv7h' 'aarch64')
license=('Apache')
url='https://github.com/waydroid'
depends=('waydroid')
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

sha256sums_x86_64=('90f9d30d98295cce2c73b5721c39ae36a3153f65af80dfa99b9575553b1f027d'
                   'e6751d318335a1252d295b9b5327bfc41eb543524b3a70f6609e92bc8dc55afd')
sha256sums_i686=('6de4cd3ff33cc863c7a720f683d890b49e66521f925fa453c61f3a53881dea10'
                 'a847a6427df06e7c99c7e7c62ea549df4bc34ecce8be4740623ddc456ff57282')
sha256sums_armv7h=('a9a159b9107420409f109f18a332c776d14c2e7d621267b0eaabbe6bf83f8ce0'
                   '53c119347681dcd8b00d7cd99a8afbd70d39b96703b000beddd49a607e203c5f')
sha256sums_aarch64=('d5004c2a6cb900c70ade4da9dfc010bee850305d1b1912650a0c90c717a94ab2'
                    '45a2ccc023472bf977190a259885cbd0524ebe9ee4d53abec7da11e541766eb3')

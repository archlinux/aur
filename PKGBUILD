# Maintainer: dangerdev <shreyanshshrivastavatop004@gmail.com>
# Contributor: Danct12 <danct12@disroot.org>
# Contributor: Bart Ribbers <bribbers@disroot.org>

_pkgver_images_system="18.1-20221231"
_pkgver_images_system_x86="18.1-20221231"
_pkgver_images_system_arm="18.1-20221231"
_pkgver_images_system_arm64="18.1-20221231"
_pkgver_images_vendor="18.1-20221231"
_pkgver_images_vendor_x86="18.1-20221231"
_pkgver_images_vendor_arm="18.1-20221231"
_pkgver_images_vendor_arm64="18.1-20221231"
pkgname=waydroid-image
pkgver="${_pkgver_images_system//-/_}"
pkgrel=1
pkgdesc="A container-based approach to boot a full Android system on a regular Linux system (Android image)"
arch=('x86_64' 'i686' 'armv7h' 'aarch64')
license=('Apache')
url='https://github.com/waydroid'
depends=('waydroid')
source_i686=(https://sourceforge.net/projects/waydroid/files/images/system/lineage/waydroid_x86/lineage-$_pkgver_images_system_x86-VANILLA-waydroid_x86-system.zip
  https://sourceforge.net/projects/waydroid/files/images/vendor/waydroid_x86/lineage-$_pkgver_images_vendor_x86-MAINLINE-waydroid_x86-vendor.zip)
source_x86_64=(https://sourceforge.net/projects/waydroid/files/images/system/lineage/waydroid_x86_64/lineage-$_pkgver_images_system-VANILLA-waydroid_x86_64-system.zip
  https://sourceforge.net/projects/waydroid/files/images/vendor/waydroid_x86_64/lineage-$_pkgver_images_vendor-MAINLINE-waydroid_x86_64-vendor.zip)
source_armv7h=(https://sourceforge.net/projects/waydroid/files/images/system/lineage/waydroid_arm/lineage-$_pkgver_images_system_arm-VANILLA-waydroid_arm-system.zip
  https://sourceforge.net/projects/waydroid/files/images/vendor/waydroid_arm/lineage-$_pkgver_images_vendor_arm-MAINLINE-waydroid_arm-vendor.zip)
source_aarch64=(https://sourceforge.net/projects/waydroid/files/images/system/lineage/waydroid_arm64/lineage-$_pkgver_images_system_arm64-VANILLA-waydroid_arm64-system.zip
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

sha256sums_x86_64=('934fbb925fa66c727ddf3cd486dcef53adeff767d594a4e6998138fa3dae4ef9'
                   'e6751d318335a1252d295b9b5327bfc41eb543524b3a70f6609e92bc8dc55afd')
sha256sums_i686=('1c86e8a7bb40b5b786ad35d693596ba28a569337f32137e871806f28d7bd9a23'
                 'a847a6427df06e7c99c7e7c62ea549df4bc34ecce8be4740623ddc456ff57282')
sha256sums_armv7h=('3d49821c731f014ed3e949dea8b7384b7631c3d4684a96924fa91246d74d8a00'
                   '53c119347681dcd8b00d7cd99a8afbd70d39b96703b000beddd49a607e203c5f')
sha256sums_aarch64=('614edfd1e81c6ed738a94408c22c6d2ac0d47ea18102e1755ab04d3e689a6431'
                    '45a2ccc023472bf977190a259885cbd0524ebe9ee4d53abec7da11e541766eb3')

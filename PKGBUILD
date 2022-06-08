# Maintainer: Danct12 <danct12@disroot.org>
# Contributor: Bart Ribbers <bribbers@disroot.org>

_pkgver_images_system="17.1-20220515"
_pkgver_images_system_x86="17.1-20220514"
_pkgver_images_system_arm="17.1-20220514"
_pkgver_images_system_arm64="17.1-20220514"
_pkgver_images_vendor="17.1-20220515"
_pkgver_images_vendor_x86="17.1-20220514"
_pkgver_images_vendor_arm="17.1-20220514"
_pkgver_images_vendor_arm64="17.1-20220514"
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

sha256sums_x86_64=('c77c5fa1a6c2db35e633ada57516823aad4d76fda546c2b8de9b606234e25e24'
                   '62ebdddd09234d57b31ff601a8fc35d84634e2b4e6308d4d17c2ccff77708433')
sha256sums_i686=('c017c8c0e6020d262ef7db8be7ec0134d66fbd23fe66d9eaa9f785eba8de7ee4'
                 '8c6dfa3352d645a20f755ada801911fe99b266c0b1be911a51b649f1e12cbfc7')
sha256sums_armv7h=('d615236f97aa5ec0095923b9bc38d95aad6e0d95fe7a90d45dd18abe2828e99b'
                   'b78d349ffcbfc5fb1c73258cf9d1f6e624c94aafa330d03e46b18731d9579dc1')
sha256sums_aarch64=('b89922cebc050ccbb15606ae38121da528dfe6c160a5d7412c91d16bf1519dcc'
                    '15d62909bafac2ddd603726e2c5f9b1ae39a37bb0bbd4226587240ee25ad3146')

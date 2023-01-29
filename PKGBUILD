# Maintainer: farwayer <farwayer@gmail.com>
# Co-maintainer: Markus Hartung (harre) <mail@hartmark.se>
# Contributer: Danct12 <danct12@disroot.org>
# Contributor: Bart Ribbers <bribbers@disroot.org>

_pkgver_images_system="18.1-20230128"
_pkgver_images_vendor="18.1-20230128"

_pkgver_images_system_x86="18.1-20230128"
_pkgver_images_vendor_x86="18.1-20230128"

_pkgver_images_system_arm64="18.1-20230128"
_pkgver_images_vendor_arm64="18.1-20230120"

_pkgver_images_system_arm="18.1-20230128"
_pkgver_images_vendor_arm="18.1-20230128"

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

sha256sums_x86_64=('9616e59c6b1b65f52c260e19ff8ca1ff10ce388c09635e955353d7c98b5f0d20'
                   '29341de0eb5405f0281200335a5b33aeaff5d81c54ffbaf7fb7b91a98391f8f2')
sha256sums_i686=('1f9461e993832f19a1c33336b0509572fe4628e75b66a7d9bc0b9fca47141449'
                 '94b330ecc5dc61d9b63788e944325d8ebc872b7aecb9bedb3b9f38494a6a8820')
sha256sums_armv7h=('ebd4be906476f1b9b934201a6336ab273b08eaa8aeaffba848c58919f9125905'
                   'e1b769053acea73e982675b54ad5c4cfbb55f022964f7a80f1f120dcee4b07db')
sha256sums_aarch64=('afb4e4c6bef4ed51e1f867efb802a5e82fa4fad92fafcd5833a7de496e1584bd'
                    '830ced67ec0049f39e2c036f2731137922522a419761708a76ec4bf82b71c6c4')

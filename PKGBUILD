# Maintainer: farwayer <farwayer@gmail.com>
# Co-maintainer: Markus Hartung (harre) <mail@hartmark.se>
# Contributer: Danct12 <danct12@disroot.org>
# Contributor: Bart Ribbers <bribbers@disroot.org>

_pkgver_images_system="18.1-20230225"
_pkgver_images_vendor="18.1-20230225"

_pkgver_images_system_x86="18.1-20230218"
_pkgver_images_vendor_x86="18.1-20230225"

_pkgver_images_system_arm64="18.1-20230218"
_pkgver_images_vendor_arm64="18.1-20230225"

_pkgver_images_system_arm="18.1-20230225"
_pkgver_images_vendor_arm="18.1-20230225"

pkgname=waydroid-image-gapps
pkgver="${_pkgver_images_system//-/_}"
pkgrel=1
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

sha256sums_x86_64=('71df9fed9041ba75b8ef2d7acee52b07f9616a69645d5401e0319550956b4cbd'
                   '509adab7b65d8fe3cc2e9574f6ef68cb33fc93ebaab04c0e37039f2fce0ff33c')
sha256sums_i686=('de573f78feb4a14b424af35c4ae8b637d5c5db5bff22cd82951b6331c7511855'
                 '309e633c4b561a6b7c694efe857637a1e1554550aa7491356acc2b03b9b4ec35')
sha256sums_armv7h=('eb9882f751a219d0e64ca3ec98b33348f5d3c03cbfe72cadca5688089be74486'
                   '635976400b377b0905d543699b4dd8372061c50eadfe0111c5d29fd0e592f287')
sha256sums_aarch64=('4eea8c96ea271b8c52bc8e35082bfd2211fdcdccbde1f2da93b9b52f9f3eb5a9'
                    '787d5ee7ad5e3401309565333591cd852f60866c5c65717eabb14e3c278def54')

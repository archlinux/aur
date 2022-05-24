# Maintainer: farwayer <farwayer@gmail.com>
# Co-maintainer: Markus Hartung (harre) <mail@hartmark.se>
# Contributer: Danct12 <danct12@disroot.org>
# Contributor: Bart Ribbers <bribbers@disroot.org>

_pkgver_images_system="17.1-20220515"
_pkgver_images_system_x86="17.1-20220514"
_pkgver_images_system_arm="17.1-20220514"
_pkgver_images_system_arm64="17.1-20220514"
_pkgver_images_vendor="17.1-20220515"
_pkgver_images_vendor_x86="17.1-20220514"
_pkgver_images_vendor_arm="17.1-20220514"
_pkgver_images_vendor_arm64="17.1-20220514"
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

sha256sums_x86_64=('d9c31855a230fc756368547972439eca9249658967c4ae3110bb1e95a6fe99b3'
                   '62ebdddd09234d57b31ff601a8fc35d84634e2b4e6308d4d17c2ccff77708433')
sha256sums_i686=('613815e4b17671d407b7f085a8de130ab34febaaa70a0428bb011c4a258a5e9b'
                 '8c6dfa3352d645a20f755ada801911fe99b266c0b1be911a51b649f1e12cbfc7')
sha256sums_armv7h=('9b2ed16ae38e8471f85b8f0dd52b57ef18fb114274d8f09d537e81318c9f9d47'
                   'b78d349ffcbfc5fb1c73258cf9d1f6e624c94aafa330d03e46b18731d9579dc1')
sha256sums_aarch64=('a560d41d03d3c11fa88fabfecd3b2126ce76f31423bf5d8f23465399e628106f'
                    '15d62909bafac2ddd603726e2c5f9b1ae39a37bb0bbd4226587240ee25ad3146')

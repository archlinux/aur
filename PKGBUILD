# Maintainer: farwayer <farwayer@gmail.com>
# Co-maintainer: Markus Hartung (harre) <mail@hartmark.se>
# Contributer: Danct12 <danct12@disroot.org>
# Contributor: Bart Ribbers <bribbers@disroot.org>

_pkgver_images_system="18.1-20230422"
_pkgver_images_vendor="18.1-20230422"

_pkgver_images_system_x86="18.1-20230422"
_pkgver_images_vendor_x86="18.1-20230422"

_pkgver_images_system_arm64="18.1-20230422"
_pkgver_images_vendor_arm64="18.1-20230422"

_pkgver_images_system_arm="18.1-20230422"
_pkgver_images_vendor_arm="18.1-20230422"

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

sha256sums_x86_64=('0943fa2507ac9dc66b4fa3bd10e6dfbee6de8a8aa1e0701e839c67955c2a8281'
                   'c97fd8f569baf1a5a4a91ca0d2db2d21b911daf0c29b8966f7640d37aa130de8')
sha256sums_i686=('7a4ee359bda91e7ef7ecce829c45d4879de2ec24933fbc6fdcfcf20d387e08fb'
                 '98d535317deaf9ab8dff8a81a85b1e5caf124694aabb57764f107719930aba08')
sha256sums_armv7h=('55c02b626e30a523a847aa62073cc6faf92fd0d3d74a433f8d8ecdc4d355ec89'
                   '570a98e70a085fd13e9950791b1b6c704ddc075a55d29397a01c7dac72dc9503')
sha256sums_aarch64=('8847cbf2e83579be2a1fdc9abe66db0483752e228fd9bc6bc41216a7f436de44'
                    '9a1982b5d789f482635a3ed181e403ab3b2fe87576d492b1baaf02cd096a22de')

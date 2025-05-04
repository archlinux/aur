# Maintainer: farwayer <farwayer@gmail.com>
# Co-maintainer: Markus Hartung (harre) <mail@hartmark.se>
# Contributer: Danct12 <danct12@disroot.org>
# Contributor: Bart Ribbers <bribbers@disroot.org>

_pkgver_images_system="20-20250503"
_pkgver_images_vendor="20-20250503"

_pkgver_images_system_x86="20-20250503"
_pkgver_images_vendor_x86="20-20250503"

_pkgver_images_system_arm64="20-20250503"
_pkgver_images_vendor_arm64="20-20250503"

_pkgver_images_system_arm="20-20250503"
_pkgver_images_vendor_arm="20-20250503"

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

sha256sums_x86_64=('3c6eb7235e2bb4c4568194a33147017b6ab2e136467e8c5864b30a3e3e09e39e'
                   'e5331c517553873620b547e02fd972df40cf060ddad37856fa15f22442ae87f3')
sha256sums_i686=('823084cd61b33ac00aa635142e891a551aee997d6f894f5ef580144ffe732ff1'
                 '664d9e7a9f07ccd407ddca7d0299d234060e69c883ddb2dbcad85fdf3b9f5818')
sha256sums_armv7h=('0b227076531f8b5a7d35c1170444e2ce96fa50c8fc202b503ed3b699aff75fa8'
                   '075ec02de1a9a2ac7e96b6cccd324a84c0ab95d9b78f0226ac1f0c07b4faf1a1')
sha256sums_aarch64=('4d1f419a637804a5ff83a1e3962b931cda7db40caed23efb833764b0f76d7921'
                    '314c1a408d0fccc6a0ba4898a1267c1c9b2af1d287818a659df4458dffa51714')

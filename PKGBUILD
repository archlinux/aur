# Maintainer: farwayer <farwayer@gmail.com>
# Co-maintainer: Markus Hartung (harre) <mail@hartmark.se>
# Contributer: Danct12 <danct12@disroot.org>
# Contributor: Bart Ribbers <bribbers@disroot.org>

_pkgver_images_system="17.1-20220723"
_pkgver_images_system_x86="17.1-20220723"
_pkgver_images_system_arm="17.1-20220723"
_pkgver_images_system_arm64="17.1-20220723"
_pkgver_images_vendor="17.1-20220723"
_pkgver_images_vendor_x86="17.1-20220723"
_pkgver_images_vendor_arm="17.1-20220723"
_pkgver_images_vendor_arm64="17.1-20220723"
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

sha256sums_x86_64=('391ccb7de6b911603b841bc511ac3db65da72406edb9e5715eb41dfe8f76052b'
                   'd76c07ef45232ccf0423fff81f396141176f9e5fbd919134218b9da4200ec2b4')
sha256sums_i686=('6ce57adfbb7e9acd97e1d5f4f0aa46d78e74479dcde72f9cbcde83912407105a'
                 '05eece26bd25851b86b19e93d2b3f3c4b50d42d0628bf96a40f96e2df9295ab1')
sha256sums_armv7h=('f7654855bab0a4e7d5c15fff3a1f05443e8e65539b158c070125b8a53ee05dab'
                   '71bee674f297fad01f3a31576d08ec9ef7a4d0709d95d7fa6a00e0793109e513')
sha256sums_aarch64=('c8f01418cd6c7bfa3fd0f55a72a2da1225626e79b331f11dad2f0c86e63355f3'
                    '4a40747f9a9a5ecdc7d881cf546232a9a8ff68b90ecd489a90f6d6499175da21')

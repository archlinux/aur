# Maintainer: éclairevoyant
# Contributor: dangerdev <dangerdev at disroot dot org>
# Contributor: Danct12 <danct12 at disroot dot org>
# Contributor: Bart Ribbers <bribbers at disroot dot org>

_pkgver_images_system="18.1-20230225"
_pkgver_images_system_x86="18.1-20230225"
_pkgver_images_system_arm="18.1-20230225"
_pkgver_images_system_arm64="18.1-20230225"
_pkgver_images_vendor="18.1-20230225"
_pkgver_images_vendor_x86="18.1-20230225"
_pkgver_images_vendor_arm="18.1-20230225"
_pkgver_images_vendor_arm64="18.1-20230225"
pkgname=waydroid-image
pkgver="${_pkgver_images_system//-/_}"
pkgrel=1
pkgdesc="LineageOS-based Android images for Waydroid"
arch=('x86_64' 'i686' 'armv7h' 'aarch64')
url='https://waydro.id'
license=('Apache')
depends=('waydroid')
_srcprefix="https://sourceforge.net/projects/waydroid/files/images"
source_x86_64=("$_srcprefix/system/lineage/waydroid_x86_64/lineage-$_pkgver_images_system-VANILLA-waydroid_x86_64-system.zip"
               "$_srcprefix/vendor/waydroid_x86_64/lineage-$_pkgver_images_vendor-MAINLINE-waydroid_x86_64-vendor.zip")
source_i686=("$_srcprefix/system/lineage/waydroid_x86/lineage-$_pkgver_images_system_x86-VANILLA-waydroid_x86-system.zip"
             "$_srcprefix/vendor/waydroid_x86/lineage-$_pkgver_images_vendor_x86-MAINLINE-waydroid_x86-vendor.zip")
source_armv7h=("$_srcprefix/system/lineage/waydroid_arm/lineage-$_pkgver_images_system_arm-VANILLA-waydroid_arm-system.zip"
               "$_srcprefix/vendor/waydroid_arm/lineage-$_pkgver_images_vendor_arm-MAINLINE-waydroid_arm-vendor.zip")
source_aarch64=("$_srcprefix/system/lineage/waydroid_arm64/lineage-$_pkgver_images_system_arm64-VANILLA-waydroid_arm64-system.zip"
                "$_srcprefix/vendor/waydroid_arm64/lineage-$_pkgver_images_vendor_arm64-MAINLINE-waydroid_arm64-vendor.zip")
sha256sums_x86_64=('a416ea53db9c1a4f61fafbe9bc05c14474be20af25e6fa6c45ae1554c5106604'
                   '509adab7b65d8fe3cc2e9574f6ef68cb33fc93ebaab04c0e37039f2fce0ff33c')
sha256sums_i686=('b7108af4519439fd62978e1675602124ff13fcfd43a1f50fbb46923353b13cf7'
                 '309e633c4b561a6b7c694efe857637a1e1554550aa7491356acc2b03b9b4ec35')
sha256sums_armv7h=('1a7580a36c97ab939262dd1589347df173f20e327f287921637f13073520f7a0'
                   '635976400b377b0905d543699b4dd8372061c50eadfe0111c5d29fd0e592f287')
sha256sums_aarch64=('e02188041ee11f1c8a8b599ba2a2bc4a6bdfed9336ce7f32de32d4e249f97ca3'
                    '787d5ee7ad5e3401309565333591cd852f60866c5c65717eabb14e3c278def54')

package() {
	install -Dm644 {system,vendor}.img -t "$pkgdir/usr/share/waydroid-extra/images/"
}

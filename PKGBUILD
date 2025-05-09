# Maintainer: Patrick Northon <northon_patrick3@yahoo.ca>
# Contributor: enamulhasanabid <enamulhabid at gmail dot com>
# Contributor: éclairevoyant
# Contributor: dangerdev <dangerdev at disroot dot org>
# Contributor: Danct12 <danct12 at disroot dot org>
# Contributor: Bart Ribbers <bribbers at disroot dot org>

_pkgver_images_system="20-20250503"
_pkgver_images_system_x86="20-20250503"
_pkgver_images_system_arm="20-20250503"
_pkgver_images_system_arm64="20-20250503"
_pkgver_images_vendor="20-20250503"
_pkgver_images_vendor_x86="20-20250503"
_pkgver_images_vendor_arm="20-20250503"
_pkgver_images_vendor_arm64="20-20250503"
pkgname=waydroid-image
pkgver="${_pkgver_images_system//-/_}"
pkgrel=1
pkgdesc="LineageOS-based Android images for Waydroid"
arch=(x86_64 i686 armv7h aarch64)
url='https://waydro.id'
license=('GPL-3.0-only')
optdepends=(waydroid)
_srcprefix="https://sourceforge.net/projects/waydroid/files/images"
source_x86_64=("$_srcprefix/system/lineage/waydroid_x86_64/lineage-$_pkgver_images_system-VANILLA-waydroid_x86_64-system.zip"
               "$_srcprefix/vendor/waydroid_x86_64/lineage-$_pkgver_images_vendor-MAINLINE-waydroid_x86_64-vendor.zip")
source_i686=("$_srcprefix/system/lineage/waydroid_x86/lineage-$_pkgver_images_system_x86-VANILLA-waydroid_x86-system.zip"
             "$_srcprefix/vendor/waydroid_x86/lineage-$_pkgver_images_vendor_x86-MAINLINE-waydroid_x86-vendor.zip")
source_armv7h=("$_srcprefix/system/lineage/waydroid_arm/lineage-$_pkgver_images_system_arm-VANILLA-waydroid_arm-system.zip"
               "$_srcprefix/vendor/waydroid_arm/lineage-$_pkgver_images_vendor_arm-MAINLINE-waydroid_arm-vendor.zip")
source_aarch64=("$_srcprefix/system/lineage/waydroid_arm64/lineage-$_pkgver_images_system_arm64-VANILLA-waydroid_arm64-system.zip"
                "$_srcprefix/vendor/waydroid_arm64/lineage-$_pkgver_images_vendor_arm64-MAINLINE-waydroid_arm64-vendor.zip")
sha256sums_x86_64=('60e2bbb7b821132b4518c9fa22581845742e09edd858831465e91a8a6b9c4087'
                   'e5331c517553873620b547e02fd972df40cf060ddad37856fa15f22442ae87f3')
sha256sums_i686=('34bafb2b528b422f20690e53dc7ffa08d54e1d89015cc1c90ac9ee76f7168b94'
                 '664d9e7a9f07ccd407ddca7d0299d234060e69c883ddb2dbcad85fdf3b9f5818')
sha256sums_armv7h=('135fab35e755eb178611bfefe980b992df963de87e695401d8f52ef552f93b5f'
                   '075ec02de1a9a2ac7e96b6cccd324a84c0ab95d9b78f0226ac1f0c07b4faf1a1')
sha256sums_aarch64=('253d34bc38158e96c449f9eb1d72cc015efdb5f72c3749118d5bd8ca9774bfbb'
                    '314c1a408d0fccc6a0ba4898a1267c1c9b2af1d287818a659df4458dffa51714')

package() {
	install -Dm644 {system,vendor}.img -t "$pkgdir/usr/share/waydroid-extra/images/"
}

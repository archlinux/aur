# Maintainer: Patrick Northon <northon_patrick3@yahoo.ca>
# Contributor: enamulhasanabid <enamulhabid at gmail dot com>
# Contributor: éclairevoyant
# Contributor: dangerdev <dangerdev at disroot dot org>
# Contributor: Danct12 <danct12 at disroot dot org>
# Contributor: Bart Ribbers <bribbers at disroot dot org>

_pkgver_sys='20.0-20250802'
_pkgver_vendor='20.0-20250803'
_pkgver_images_system=$_pkgver_sys
_pkgver_images_system_x86=$_pkgver_sys
_pkgver_images_system_arm=$_pkgver_sys
_pkgver_images_system_arm64=$_pkgver_sys
_pkgver_images_vendor=$_pkgver_vendor
_pkgver_images_vendor_x86=$_pkgver_vendor
_pkgver_images_vendor_arm=$_pkgver_vendor
_pkgver_images_vendor_arm64=$_pkgver_vendor
pkgname=waydroid-image
pkgver="${_pkgver_vendor//-/.}"
pkgrel=1
epoch=1
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
sha256sums_x86_64=('ea42d46dc77cc945c7149799940da80d75b47eccbf4fe822ba0fa524ecc02132'
                   '693a886beba550f061f4ee5a901cf97a863d3f0ef4ef6f3db2b813a166fa032c')
sha256sums_i686=('d9ea9fc23ca9915fad82140e3e78a21552779c728ff44e714667a4d34e2f4980'
                 '527f0e4b5953df336baf7b9ca9a285962dd6d1c7cfae26f964034e85e31245bd')
sha256sums_armv7h=('de675b26488abf956d74422d6018488545964bde30e4440298db71b39e619c8c'
                   '1b7cc008f39d7749db411254668babd65b6f9aa0c6517062fb3be31414f6ebb1')
sha256sums_aarch64=('26dc4985df5e7e9de2b505a66b5e0aa1d6a2d8d1d3be25eef0ade5ff81dc673d'
                    'e9d8dc15f2e4a8929960731bbd5c0dc04b197550319bae4cdc194228aa6da40f')

package() {
	install -Dm644 {system,vendor}.img -t "$pkgdir/usr/share/waydroid-extra/images/"
}

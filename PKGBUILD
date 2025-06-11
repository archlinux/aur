# Maintainer: Patrick Northon <northon_patrick3@yahoo.ca>
# Contributor: enamulhasanabid <enamulhabid at gmail dot com>
# Contributor: éclairevoyant
# Contributor: dangerdev <dangerdev at disroot dot org>
# Contributor: Danct12 <danct12 at disroot dot org>
# Contributor: Bart Ribbers <bribbers at disroot dot org>

_pkgver='20.0-20250607'
_pkgver_images_system=$_pkgver
_pkgver_images_system_x86=$_pkgver
_pkgver_images_system_arm=$_pkgver
_pkgver_images_system_arm64=$_pkgver
_pkgver_images_vendor=$_pkgver
_pkgver_images_vendor_x86=$_pkgver
_pkgver_images_vendor_arm=$_pkgver
_pkgver_images_vendor_arm64=$_pkgver
pkgname=waydroid-image
pkgver="${_pkgver//-/.}"
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
sha256sums_x86_64=('c4457ee79d5edaa1aaad25107635643df4485d722d27977dd94df58456afbe7f'
                   'b10c64bc0b421f86839de5e610b2089bc8fc2fa8970163342ce4d0d959ff824d')
sha256sums_i686=('6f5008e4e4f130b834c256ab3eef3ec650c9d532581b59c09bc7e99ad2dff1ad'
                 'e3e1bd9d9e73521f1deea445cc5aae95a3fca74c79247bbe6a8a2bbb4d17337a')
sha256sums_armv7h=('ad8f8a2abdd8ae6fb8ef4996ce081cea2d588b121e2eae48838afdfc9ab4bdfd'
                   '5dd71fa513f88eb4db2b6a2657057b2e3bca40359952f4ac5f384c2b0cb2202b')
sha256sums_aarch64=('a3b6d45021ab7325856777cb051432420d189472d73b75d25e34e54cabfd4f58'
                    '120c30311554cff26374402597df864485a304c3e4410dd2092d06a6529507be')

package() {
	install -Dm644 {system,vendor}.img -t "$pkgdir/usr/share/waydroid-extra/images/"
}

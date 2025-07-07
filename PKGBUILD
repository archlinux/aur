# Maintainer: Patrick Northon <northon_patrick3@yahoo.ca>
# Contributor: enamulhasanabid <enamulhabid at gmail dot com>
# Contributor: éclairevoyant
# Contributor: dangerdev <dangerdev at disroot dot org>
# Contributor: Danct12 <danct12 at disroot dot org>
# Contributor: Bart Ribbers <bribbers at disroot dot org>

_pkgver='20.0-20250705'
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
sha256sums_x86_64=('ad1c9c6681d4a82494ca6496a100e77638488cb877151f826e7ad71fcee3be6a'
                   'c989fa0c68b5ff7235e6b6fe6044c19e6ef960d9684e653cd4db3ef912b14188')
sha256sums_i686=('75fe5c52ba494ea112b0c9e578e7be8051511959c0c142929541f44d6c8d1a3e'
                 'b2ac450059a6c15ba47917f0ee2347af03e5d10eadf4ce6d89e7bb543cef1a07')
sha256sums_armv7h=('63a6637a9fbfe9f9c1cf0b35f74c7c7602996ea2c269cf98667157a08842381a'
                   '5d19854079ee7456010da5859edf7c2199e20b33aadbd6ab79864195fb5c64dd')
sha256sums_aarch64=('a3fb937439fdfd91ec1e736f92fbec17feddc9d80a6caef71726f7d11ac867ae'
                    '102862f395011e2215f07910df3148bdd060fdffaf6df6a2de5c62286e5f783f')

package() {
	install -Dm644 {system,vendor}.img -t "$pkgdir/usr/share/waydroid-extra/images/"
}

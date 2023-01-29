# Maintainer: éclairevoyant
# Contributor: dangerdev <dangerdev at disroot dot org>
# Contributor: Danct12 <danct12 at disroot dot org>
# Contributor: Bart Ribbers <bribbers at disroot dot org>

_pkgver_images_system="18.1-20230128"
_pkgver_images_system_x86="18.1-20230128"
_pkgver_images_system_arm="18.1-20230128"
_pkgver_images_system_arm64="18.1-20230128"
_pkgver_images_vendor="18.1-20230128"
_pkgver_images_vendor_x86="18.1-20230128"
_pkgver_images_vendor_arm="18.1-20230128"
_pkgver_images_vendor_arm64="18.1-20230120"
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
sha256sums_x86_64=('76479c9c918fcf84889be035353a0cb95f76b0f071f62ee15159a3415b9c1eb7'
                   '29341de0eb5405f0281200335a5b33aeaff5d81c54ffbaf7fb7b91a98391f8f2')
sha256sums_i686=('619101237b375a4406c5666beee44dc1c9cfa5654284787cb10183395b414c77'
                 '94b330ecc5dc61d9b63788e944325d8ebc872b7aecb9bedb3b9f38494a6a8820')
sha256sums_armv7h=('a09db706b0108d670986f8ce60ce0099d7659be4a3ebe1d6826e16a56dac0cab'
                   'e1b769053acea73e982675b54ad5c4cfbb55f022964f7a80f1f120dcee4b07db')
sha256sums_aarch64=('129d7b7c452b743685679f9dd8475ad3f8fad90c9d295940f0966ea88201ccf1'
                    '830ced67ec0049f39e2c036f2731137922522a419761708a76ec4bf82b71c6c4')

package() {
	install -Dm644 {system,vendor}.img -t "$pkgdir/usr/share/waydroid-extra/images/"
}

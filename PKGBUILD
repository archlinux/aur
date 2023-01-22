# Maintainer: éclairevoyant
# Contributor: dangerdev <dangerdev at disroot dot org>
# Contributor: Danct12 <danct12 at disroot dot org>
# Contributor: Bart Ribbers <bribbers at disroot dot org>

_pkgver_images_system="18.1-20230121"
_pkgver_images_system_x86="18.1-20230121"
_pkgver_images_system_arm="18.1-20230121"
_pkgver_images_system_arm64="18.1-20230119"
_pkgver_images_vendor="18.1-20230121"
_pkgver_images_vendor_x86="18.1-20230121"
_pkgver_images_vendor_arm="18.1-20230121"
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
sha256sums_x86_64=('5e7980807c658998ac6f24e13910d8d5792bb5bba675940f2c75572136be9a69'
                   '8ca97a09e7f837a2248580e1349819628032fff3120a66dd682147aa38a5ae7e')
sha256sums_i686=('cf67ca90d4d2a6f0a8eff6fd32d5d67764147468d68e369174c3b4b84bebbbb6'
                 '3d96275fc39e313fa7878f3f49ac09401578200e9972cac52188e3573ca2fa25')
sha256sums_armv7h=('6f64581a003b5c90d60080ebac125e12ba152e36b260e0a0c182d192de0ba0d9'
                   '03fead8d19d6ad4e01dd6db77f00c91164b47c2d9d2a159a18f73cafe8cf8f0e')
sha256sums_aarch64=('b71752429e2244dddde5153a7a327196cb53a770f2f80575937519a7db04c37e'
                    '830ced67ec0049f39e2c036f2731137922522a419761708a76ec4bf82b71c6c4')

package() {
	install -Dm644 {system,vendor}.img -t "$pkgdir/usr/share/waydroid-extra/images/"
}

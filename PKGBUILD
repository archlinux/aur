# Maintainer: éclairevoyant
# Contributor: dangerdev <dangerdev at disroot dot org>
# Contributor: Danct12 <danct12 at disroot dot org>
# Contributor: Bart Ribbers <bribbers at disroot dot org>

_pkgver_images_system="18.1-20230318"
_pkgver_images_system_x86="18.1-20230318"
_pkgver_images_system_arm="18.1-20230318"
_pkgver_images_system_arm64="18.1-20230318"
_pkgver_images_vendor="18.1-20230318"
_pkgver_images_vendor_x86="18.1-20230318"
_pkgver_images_vendor_arm="18.1-20230318"
_pkgver_images_vendor_arm64="18.1-20230318"
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
sha256sums_x86_64=('57424a00ebce78bc8bc9e1331bd312e2c8a9152e72dd0f9eac9689ffe6d8ad0d'
                   '2fcbe079346a609b9f8fadbe2911c9363ec1d19fc7debe435f5ff580778fb3a3')
sha256sums_i686=('e507d95cda48789c5e36cd38ba3a3183d68e250644eb3f1ab9693aef8d1e51b3'
                 '6707c1ed32d997e36bcbf86a064e781e338f7a63b614557ab1f07c76a577263c')
sha256sums_armv7h=('a01790d81fe2ca61889ffb5c2310b182b1e4f0c2566a464e631ddc6adeb57b8a'
                   '875710284f2f1d6694ca047cedc8d6275269779be7225b231c68e02d0413159d')
sha256sums_aarch64=('a15722490e30b64611720234ed3f0702d600bb8c648880ae0f1f06236b02b904'
                    '8f23f214f27d4800b58b509bd0ff824dd54b6cbe803af7412d7aae68fb73a59c')

package() {
	install -Dm644 {system,vendor}.img -t "$pkgdir/usr/share/waydroid-extra/images/"
}

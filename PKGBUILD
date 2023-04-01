# Maintainer: éclairevoyant
# Contributor: dangerdev <dangerdev at disroot dot org>
# Contributor: Danct12 <danct12 at disroot dot org>
# Contributor: Bart Ribbers <bribbers at disroot dot org>

_pkgver_images_system="18.1-20230401"
_pkgver_images_system_x86="18.1-20230401"
_pkgver_images_system_arm="18.1-20230401"
_pkgver_images_system_arm64="18.1-20230401"
_pkgver_images_vendor="18.1-20230401"
_pkgver_images_vendor_x86="18.1-20230401"
_pkgver_images_vendor_arm="18.1-20230401"
_pkgver_images_vendor_arm64="18.1-20230401"
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
sha256sums_x86_64=('8b98b292ce084e7cbccc3f13a47d01264cf9520ed361691e8d94a8eb0f895839'
                   'a86294542b28d46b1afba6dd56deb1eeadffc166eac2663124403b8c876f6ff3')
sha256sums_i686=('16a906c453f09317e9051d07d9dd2001a634e3e487d8a5ebac03d4b5ffa72fe5'
                 '094ce9c2a83984181f59dbdd8825d0b96fae067df53e0223414eee86b261f193')
sha256sums_armv7h=('0dcd2ba42661b1b8b937c0a4d261c8b34290d165eb4efc9673d5a74a4fa4808b'
                   '3601192e3e53d19c311d587744c791e9df44da23bca407a35e2899ff415e0c7c')
sha256sums_aarch64=('b149c5e6e0146100707e6af6c11cdedc8e89c6c88fe1f33bf12b09ecd87ed7a0'
                    '06bdb087bdc02808917dca12203f2c7ac3004df853080099bc5aba3db21645da')

package() {
	install -Dm644 {system,vendor}.img -t "$pkgdir/usr/share/waydroid-extra/images/"
}

# Maintainer: éclairevoyant
# Contributor: dangerdev <dangerdev at disroot dot org>
# Contributor: Danct12 <danct12 at disroot dot org>
# Contributor: Bart Ribbers <bribbers at disroot dot org>

_pkgver_images_system="18.1-20240106"
_pkgver_images_system_x86="18.1-20240106"
_pkgver_images_system_arm="18.1-20240106"
_pkgver_images_system_arm64="18.1-20240106"
_pkgver_images_vendor="18.1-20240106"
_pkgver_images_vendor_x86="18.1-20240106"
_pkgver_images_vendor_arm="18.1-20240106"
_pkgver_images_vendor_arm64="18.1-20240106"
pkgname=waydroid-image
pkgver="${_pkgver_images_system//-/_}"
pkgrel=1
pkgdesc="LineageOS-based Android images for Waydroid"
arch=(x86_64 i686 armv7h aarch64)
url='https://waydro.id'
license=(Apache)
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
sha256sums_x86_64=('0656327c3767f42a4a14bbfb13f3d4a651f0211cbc6be3ba3018c515d1ce2387'
                   'a8bfcfd5a0ff91aa34a018ef436f37ced143d4ad65db19904ab4fecbfb57e411')
sha256sums_i686=('c36e76d5824f34089f93cd8ab30192f68cdfc1c014935bb8888a620879d96ac6'
                 'c9280b4caf6880c59611dddc10eda63e80071b25ba023394db586bf98380edc2')
sha256sums_armv7h=('f6d4a4cc1831bd02c07c7203f68166b10534a388219797d3e4391acfb42e284f'
                   '1f730452e2b01a8d795e361af07095d370902a1a2d233af0de8ea0424d073f23')
sha256sums_aarch64=('030837acbde2706fd74b52137b4648494a73b1b1b98da20bf4261f61483bb73d'
                    '9f82249481cf9dda22b4b070cea3e0f7e1c441722ef880c1c44c9d0aa41f740e')

package() {
	install -Dm644 {system,vendor}.img -t "$pkgdir/usr/share/waydroid-extra/images/"
}

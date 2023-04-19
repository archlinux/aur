# Maintainer: éclairevoyant
# Contributor: dangerdev <dangerdev at disroot dot org>
# Contributor: Danct12 <danct12 at disroot dot org>
# Contributor: Bart Ribbers <bribbers at disroot dot org>

_pkgver_images_system="18.1-20230415"
_pkgver_images_system_x86="18.1-20230415"
_pkgver_images_system_arm="18.1-20230415"
_pkgver_images_system_arm64="18.1-20230415"
_pkgver_images_vendor="18.1-20230415"
_pkgver_images_vendor_x86="18.1-20230415"
_pkgver_images_vendor_arm="18.1-20230415"
_pkgver_images_vendor_arm64="18.1-20230415"
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
sha256sums_x86_64=('9df7dc6fe33a141300cec81d75ecef32f4193a6ea11ca2e435c11e346acf2b46'
                   '7c9ecfb27ef3d5ba9b103fbd49a25dbbbfbbb0da4505f39be3d1385e32a0f85a')
sha256sums_i686=('b002a4c70c1919c06a2fd05b2edadadc3804095b67ce86a49eb987060ac91c65'
                 'bec9bc379c6d3c0a29baff3c4a7d31cdbd1ee3aa710d0dad63bf48e2e934dafd')
sha256sums_armv7h=('90f46f037e8bc2e036fb70b44d57a97118aadc5086f15ee9ae84a64c8140d2c2'
                   '8e283c3baceec050fc5bcde1be821ae953852589dd01b4bcec1979c24d7c974b')
sha256sums_aarch64=('58bef40ee4914b5770eb8b505b781ded9115e6c8e80e0929ea628a4c92e50885'
                    '50adc3a1863b69e3f3c00b61ba1a009be3cc612d3ae4cba75e15fd1dba265f21')

package() {
	install -Dm644 {system,vendor}.img -t "$pkgdir/usr/share/waydroid-extra/images/"
}

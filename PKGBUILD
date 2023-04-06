# Maintainer: éclairevoyant
# Contributor: dangerdev <dangerdev at disroot dot org>
# Contributor: Danct12 <danct12 at disroot dot org>
# Contributor: Bart Ribbers <bribbers at disroot dot org>

_pkgver_images_system="18.1-20230402"
_pkgver_images_system_x86="18.1-20230402"
_pkgver_images_system_arm="18.1-20230402"
_pkgver_images_system_arm64="18.1-20230402"
_pkgver_images_vendor="18.1-20230402"
_pkgver_images_vendor_x86="18.1-20230402"
_pkgver_images_vendor_arm="18.1-20230401"
_pkgver_images_vendor_arm64="18.1-20230402"
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
sha256sums_x86_64=('840728716beddc58206aea0f465272b5bbedfd95085ced59df53e984d7213b94'
                   'b928d31a5dd9750b619dde61fd21ce5914939026ef27c04af72a51b3dddeb78f')
sha256sums_i686=('acf72d6239da2b794b0784ec0359a59b15136bee2c6ae8e82502b3b184701e88'
                 '9e4a88cec098d2360754a40eb4afae7feef9fb1cc4d01903bab26cb80b4b904b')
sha256sums_armv7h=('15afa9d9b809f44da8af6ad43474087de605a1ae740f5de713d6843cabcd3729'
                   '3601192e3e53d19c311d587744c791e9df44da23bca407a35e2899ff415e0c7c')
sha256sums_aarch64=('ba1f7041ef0328b8733a79cb504c821188bcb2073c54b72dc2fc2ef0798242d8'
                    'b83b5bd2649eaa41b8ddf3cf5415378c5021306c56246e98aa3c59895ece7868')

package() {
	install -Dm644 {system,vendor}.img -t "$pkgdir/usr/share/waydroid-extra/images/"
}

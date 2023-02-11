# Maintainer: éclairevoyant
# Contributor: dangerdev <dangerdev at disroot dot org>
# Contributor: Danct12 <danct12 at disroot dot org>
# Contributor: Bart Ribbers <bribbers at disroot dot org>

_pkgver_images_system="18.1-20230211"
_pkgver_images_system_x86="18.1-20230212"
_pkgver_images_system_arm="18.1-20230212"
_pkgver_images_system_arm64="18.1-20230211"
_pkgver_images_vendor="18.1-20230204"
_pkgver_images_vendor_x86="18.1-20230211"
_pkgver_images_vendor_arm="18.1-20230211"
_pkgver_images_vendor_arm64="18.1-20230212"
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
sha256sums_x86_64=('d2d528d64173c2a68683241a08d16e19ba1003bf0e1dafc767a021682a8b7f40'
                   '5eab9c46a5f5792c9df79c8509c738a190022ef1670de45fa1028c8524b1b0d9')
sha256sums_i686=('fcb3c26e95f22e4fc137529f20a6b1aa602c70736d39132390e171614a0fc0ff'
                 '47c5b6d0f8fb5b87e61157e368d2e9a3899d23b64204d7dfc3c362711a0ae3ea')
sha256sums_armv7h=('389fc3434f53ead66c18849a8edce9b7496578a8f7189b2bfdbce71b4944fbce'
                   '38f1ad1cf020fb772bbb7ad8687c7010bfbf3c0da385a44dbbfd50efed92bec8')
sha256sums_aarch64=('ea91089390b4d7943e8bc3b8eb4462c4508251b34cd7de6488e05455acaa1bcf'
                    '9f6d023b55547e84ab5f8ac381b468a4bcb506529ec4c9e678877b68ea05eea4')

package() {
	install -Dm644 {system,vendor}.img -t "$pkgdir/usr/share/waydroid-extra/images/"
}

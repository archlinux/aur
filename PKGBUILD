# Maintainer: éclairevoyant
# Contributor: dangerdev <dangerdev at disroot dot org>
# Contributor: Danct12 <danct12 at disroot dot org>
# Contributor: Bart Ribbers <bribbers at disroot dot org>

_pkgver_images_system="18.1-20230422"
_pkgver_images_system_x86="18.1-20230422"
_pkgver_images_system_arm="18.1-20230422"
_pkgver_images_system_arm64="18.1-20230422"
_pkgver_images_vendor="18.1-20230422"
_pkgver_images_vendor_x86="18.1-20230422"
_pkgver_images_vendor_arm="18.1-20230422"
_pkgver_images_vendor_arm64="18.1-20230422"
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
sha256sums_x86_64=('8bc82f766bd5f836fd41a073cf4378d8e574c60cf30894deb9521213a2b18416'
                   'c97fd8f569baf1a5a4a91ca0d2db2d21b911daf0c29b8966f7640d37aa130de8')
sha256sums_i686=('a980a3c56a1468829ded175d75a170549dbdd38e4a4dd5d513a336c47568f77c'
                 '98d535317deaf9ab8dff8a81a85b1e5caf124694aabb57764f107719930aba08')
sha256sums_armv7h=('fe5a93da4d3446ff7e16c500065ba68755d6fda6904c9ef947216e7795daa781'
                   '570a98e70a085fd13e9950791b1b6c704ddc075a55d29397a01c7dac72dc9503')
sha256sums_aarch64=('ad0826f3587340786797866e963478e85d2282f9e83d4aa0fbddd97c8798aaee'
                    '9a1982b5d789f482635a3ed181e403ab3b2fe87576d492b1baaf02cd096a22de')

package() {
	install -Dm644 {system,vendor}.img -t "$pkgdir/usr/share/waydroid-extra/images/"
}

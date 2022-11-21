# Contributor: ZhangHua <zhanghua.00 at qq dot com>
# Contributor: Danct12 <danct12@disroot.org>
# Contributor: Bart Ribbers <bribbers@disroot.org>

_pkgver_images_system="18.1-20221109"
_pkgver_images_system_x86="18.1-20221109"
_pkgver_images_system_arm="18.1-20221110"
_pkgver_images_system_arm64="18.1-20221111"
_pkgver_images_vendor="18.1-20221109"
_pkgver_images_vendor_x86="18.1-20221109"
_pkgver_images_vendor_arm="18.1-20221110"
_pkgver_images_vendor_arm64="18.1-20221110"

_vendor_type=HALIUM_11
_system_type=VANILLA

pkgname=waydroid-image-halium
pkgver="${_pkgver_images_system//-/_}"
pkgrel=2
pkgdesc="A container-based approach to boot a full Android system on a regular Linux system (Android image with halium)"
arch=('x86_64' 'i686' 'armv7h' 'aarch64')
license=('Apache')
url='https://github.com/waydroid'
depends=('waydroid')
provides=('waydroid-image')
conflicts=('waydroid-image')
source_i686=(https://sourceforge.net/projects/waydroid/files/images/system/lineage/waydroid_x86/lineage-$_pkgver_images_system_x86-$_system_type-waydroid_x86-system.zip
  https://sourceforge.net/projects/waydroid/files/images/vendor/waydroid_x86/lineage-$_pkgver_images_vendor_x86-$_vendor_type-waydroid_x86-vendor.zip)
source_x86_64=(https://sourceforge.net/projects/waydroid/files/images/system/lineage/waydroid_x86_64/lineage-$_pkgver_images_system-$_system_type-waydroid_x86_64-system.zip
  https://sourceforge.net/projects/waydroid/files/images/vendor/waydroid_x86_64/lineage-$_pkgver_images_vendor-$_vendor_type-waydroid_x86_64-vendor.zip)
source_armv7h=(https://sourceforge.net/projects/waydroid/files/images/system/lineage/waydroid_arm/lineage-$_pkgver_images_system_arm-$_system_type-waydroid_arm-system.zip
  https://sourceforge.net/projects/waydroid/files/images/vendor/waydroid_arm/lineage-$_pkgver_images_vendor_arm-$_vendor_type-waydroid_arm-vendor.zip)
source_aarch64=(https://sourceforge.net/projects/waydroid/files/images/system/lineage/waydroid_arm64/lineage-$_pkgver_images_system_arm64-$_system_type-waydroid_arm64-system.zip
  https://sourceforge.net/projects/waydroid/files/images/vendor/waydroid_arm64/lineage-$_pkgver_images_vendor_arm64-$_vendor_type-waydroid_arm64-vendor.zip)

pkgver() {
  echo ${_pkgver_images_system//-/_}
}

package() {
  install -dm755 "$pkgdir/usr/share/waydroid-extra/images"

  # makepkg have extracted the zips
  mv "$srcdir/system.img" "$pkgdir/usr/share/waydroid-extra/images"
  mv "$srcdir/vendor.img" "$pkgdir/usr/share/waydroid-extra/images"
}

sha256sums_x86_64=('f2262a8109291104c56d4dcc777e2f7b8d5341c00a8ba7ba75dd71312b373d69'
                   'd122b33e1d070d305b734c71dd94ecbca40563e2dbe75c6d91d45dab0d07cb2a')
sha256sums_i686=('f00e10fff4f49310cacf455970ea37ea0984ed754fc0e500bdb33d3447346f78'
                 '79fc6ce2dde6e0eb8dff9ce9d4dad1a20d049f376e820318117f960c8b87407f')
sha256sums_armv7h=('03cb771bb2747db543bc54169acd157659cceeca0b018308b44e18e43f82bd6d'
                   'dc225ec44e7d049f7b697ccc8a7f7673d28b4c462734ef61772d8cbdf809bcee')
sha256sums_aarch64=('ddd199470dfc564c812ef1f65b7d7a98fa5953a571cc4f51a1bf6a3031c41f1b'
                    '1f92cbd5e1b6c51ae42e1cece0f30580c618ba22f10e9fcdd7579a18abdd244f')

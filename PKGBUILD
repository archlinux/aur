# Maintainer: Danct12 <danct12@disroot.org>
# Contributor: Bart Ribbers <bribbers@disroot.org>

_pkgver_images_system="18.1-20221109"
_pkgver_images_system_x86="18.1-20221109"
_pkgver_images_system_arm="18.1-20221110"
_pkgver_images_system_arm64="18.1-20221111"
_pkgver_images_vendor="18.1-20221109"
_pkgver_images_vendor_x86="18.1-20221109"
_pkgver_images_vendor_arm="18.1-20221110"
_pkgver_images_vendor_arm64="18.1-20221110"
pkgname=waydroid-image
pkgver="${_pkgver_images_system//-/_}"
pkgrel=1
pkgdesc="A container-based approach to boot a full Android system on a regular Linux system (Android image)"
arch=('x86_64' 'i686' 'armv7h' 'aarch64')
license=('Apache')
url='https://github.com/waydroid'
depends=('waydroid')
source_i686=(https://sourceforge.net/projects/waydroid/files/images/system/lineage/waydroid_x86/lineage-$_pkgver_images_system_x86-VANILLA-waydroid_x86-system.zip
  https://sourceforge.net/projects/waydroid/files/images/vendor/waydroid_x86/lineage-$_pkgver_images_vendor_x86-MAINLINE-waydroid_x86-vendor.zip)
source_x86_64=(https://sourceforge.net/projects/waydroid/files/images/system/lineage/waydroid_x86_64/lineage-$_pkgver_images_system-VANILLA-waydroid_x86_64-system.zip
  https://sourceforge.net/projects/waydroid/files/images/vendor/waydroid_x86_64/lineage-$_pkgver_images_vendor-MAINLINE-waydroid_x86_64-vendor.zip)
source_armv7h=(https://sourceforge.net/projects/waydroid/files/images/system/lineage/waydroid_arm/lineage-$_pkgver_images_system_arm-VANILLA-waydroid_arm-system.zip
  https://sourceforge.net/projects/waydroid/files/images/vendor/waydroid_arm/lineage-$_pkgver_images_vendor_arm-MAINLINE-waydroid_arm-vendor.zip)
source_aarch64=(https://sourceforge.net/projects/waydroid/files/images/system/lineage/waydroid_arm64/lineage-$_pkgver_images_system_arm64-VANILLA-waydroid_arm64-system.zip
  https://sourceforge.net/projects/waydroid/files/images/vendor/waydroid_arm64/lineage-$_pkgver_images_vendor_arm64-MAINLINE-waydroid_arm64-vendor.zip)

case "$CARCH" in
  aarch64) _imgarch="arm64" ;;
  armv7h) _imgarch="arm" ;;
  *) _imgarch="$CARCH" ;;
esac

package() {
  install -dm755 "$pkgdir/usr/share/waydroid-extra/images"

  # makepkg have extracted the zips
  mv "$srcdir/system.img" "$pkgdir/usr/share/waydroid-extra/images"
  mv "$srcdir/vendor.img" "$pkgdir/usr/share/waydroid-extra/images"
}

sha256sums_x86_64=('f2262a8109291104c56d4dcc777e2f7b8d5341c00a8ba7ba75dd71312b373d69'
                   '24374d6978cc4a03b1fbc4b2d11d4afa430ebd9d8f93b452481d77b7e8b7d3b6')
sha256sums_i686=('f00e10fff4f49310cacf455970ea37ea0984ed754fc0e500bdb33d3447346f78'
                 '37698fcce8f185baa6e4e7674a418b009d2ad6515f48e1954fa47d62a3e5dd24')
sha256sums_armv7h=('03cb771bb2747db543bc54169acd157659cceeca0b018308b44e18e43f82bd6d'
                   'db23686798ba272ce793e91320a4bfd77cdf9d6d6e49915d70fdedbb267c92a2')
sha256sums_aarch64=('ddd199470dfc564c812ef1f65b7d7a98fa5953a571cc4f51a1bf6a3031c41f1b'
                    '83eb0a7cd437f4de2e6b9c78f7d6a819eb28094117d092365bbf41b667950ddc')

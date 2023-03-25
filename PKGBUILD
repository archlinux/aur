# Maintainer: farwayer <farwayer@gmail.com>
# Co-maintainer: Markus Hartung (harre) <mail@hartmark.se>
# Contributer: Danct12 <danct12@disroot.org>
# Contributor: Bart Ribbers <bribbers@disroot.org>

_pkgver_images_system="18.1-20230318"
_pkgver_images_vendor="18.1-20230318"

_pkgver_images_system_x86="18.1-20230318"
_pkgver_images_vendor_x86="18.1-20230318"

_pkgver_images_system_arm64="18.1-20230318"
_pkgver_images_vendor_arm64="18.1-20230318"

_pkgver_images_system_arm="18.1-20230318"
_pkgver_images_vendor_arm="18.1-20230318"

pkgname=waydroid-image-gapps
pkgver="${_pkgver_images_system//-/_}"
pkgrel=1
pkgdesc="A container-based approach to boot a full Android system on a regular Linux system (Android image, GAPPS)."
arch=('x86_64' 'i686' 'armv7h' 'aarch64')
license=('Apache')
url='https://github.com/waydroid'
depends=('waydroid')
provides=('waydroid-image')
source_i686=(https://sourceforge.net/projects/waydroid/files/images/system/lineage/waydroid_x86/lineage-$_pkgver_images_system_x86-GAPPS-waydroid_x86-system.zip
  https://sourceforge.net/projects/waydroid/files/images/vendor/waydroid_x86/lineage-$_pkgver_images_vendor_x86-MAINLINE-waydroid_x86-vendor.zip)
source_x86_64=(https://sourceforge.net/projects/waydroid/files/images/system/lineage/waydroid_x86_64/lineage-$_pkgver_images_system-GAPPS-waydroid_x86_64-system.zip
  https://sourceforge.net/projects/waydroid/files/images/vendor/waydroid_x86_64/lineage-$_pkgver_images_vendor-MAINLINE-waydroid_x86_64-vendor.zip)
source_armv7h=(https://sourceforge.net/projects/waydroid/files/images/system/lineage/waydroid_arm/lineage-$_pkgver_images_system_arm-GAPPS-waydroid_arm-system.zip
  https://sourceforge.net/projects/waydroid/files/images/vendor/waydroid_arm/lineage-$_pkgver_images_vendor_arm-MAINLINE-waydroid_arm-vendor.zip)
source_aarch64=(https://sourceforge.net/projects/waydroid/files/images/system/lineage/waydroid_arm64/lineage-$_pkgver_images_system_arm64-GAPPS-waydroid_arm64-system.zip
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

sha256sums_x86_64=('5fd0f3215626827a982d8db0c675b9be18f108dc93c555ceb746c8d4322d7533'
                   '2fcbe079346a609b9f8fadbe2911c9363ec1d19fc7debe435f5ff580778fb3a3')
sha256sums_i686=('40cb2e4d94dbf586ebc7a3643c88d8ff322bc3839372d873dec8e602d2b0fe22'
                 '6707c1ed32d997e36bcbf86a064e781e338f7a63b614557ab1f07c76a577263c')
sha256sums_armv7h=('a62b6cfe8596a8543c3ea79ee8760847f40296c617196752ba453b5f49811bfe'
                   '875710284f2f1d6694ca047cedc8d6275269779be7225b231c68e02d0413159d')
sha256sums_aarch64=('0485c332b226edc998404f40200c9acb88a721ae0435672658ba61e3b3af99e0'
                    '8f23f214f27d4800b58b509bd0ff824dd54b6cbe803af7412d7aae68fb73a59c')

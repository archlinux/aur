# Maintainer: dangerdev <dangerdev@disroot.org>
# Contributor: Danct12 <danct12@disroot.org>
# Contributor: Bart Ribbers <bribbers@disroot.org>

_pkgver_images_system="18.1-20230114"
_pkgver_images_system_x86="18.1-20230114"
_pkgver_images_system_arm="18.1-20230114"
_pkgver_images_system_arm64="18.1-20230114"
_pkgver_images_vendor="18.1-20230114"
_pkgver_images_vendor_x86="18.1-20230114"
_pkgver_images_vendor_arm="18.1-20230114"
_pkgver_images_vendor_arm64="18.1-20230114"
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

sha256sums_x86_64=('bac31186e8f847434f3d1e5f887661b35674891ffc58ccca98c2e319835cbd45'
                   '7840af0a4d060ea81fb3933dc3b64a7f4679e86d868a2585804e0f7365b5e289')
sha256sums_i686=('048220b2686aa28258be408c9bbf10771d572e733c3866789ea6359bdaa553de'
                 'ea1dd8e6c3dcb279ae45390304e7f05ebc6e6938edfaf80103c29bfd0af75af1')
sha256sums_armv7h=('5b0a55798d994b880f0a22f297ba8343f8c502c86a787f68f226ef6faaea86aa'
                   '2d83ebdfda48ffd7952ed1d2294cdc3f358499f5397ab092dd44581adb446269')
sha256sums_aarch64=('2addd3835b5f8f688abb4d1728c2afc785ffb287d6c42928052473b20568482b'
                    '87be5196c7b1998c29a1442cdf4bdd77f11d7149277ac4afc49fb9126f727cdc')

# Maintainer: Danct12 <danct12@disroot.org>
# Contributor: Bart Ribbers <bribbers@disroot.org>

_pkgver_images_system="17.1-20220723"
_pkgver_images_system_x86="17.1-20220723"
_pkgver_images_system_arm="17.1-20220723"
_pkgver_images_system_arm64="17.1-20220723"
_pkgver_images_vendor="17.1-20220723"
_pkgver_images_vendor_x86="17.1-20220723"
_pkgver_images_vendor_arm="17.1-20220723"
_pkgver_images_vendor_arm64="17.1-20220723"
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

sha256sums_x86_64=('82023e7b04adeea64fa0073f335f55300b67c8f4cf866eb1629da2fd2eae072d'
                   'd76c07ef45232ccf0423fff81f396141176f9e5fbd919134218b9da4200ec2b4')
sha256sums_i686=('2e022c086af68e65129c07fc18c07d54fee6630d7f19024161c4111f238f67a6'
                 '05eece26bd25851b86b19e93d2b3f3c4b50d42d0628bf96a40f96e2df9295ab1')
sha256sums_armv7h=('7c7c06135a6c31db6b27cf392c07754890134052b2be5c0c2c7538fea86cfbab'
                   '71bee674f297fad01f3a31576d08ec9ef7a4d0709d95d7fa6a00e0793109e513')
sha256sums_aarch64=('fc600f3cfa994c8d5619386b7ef764307731102a4ebd854424487f7858a04d91'
                    '4a40747f9a9a5ecdc7d881cf546232a9a8ff68b90ecd489a90f6d6499175da21')

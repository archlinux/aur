# Maintainer: Danct12 <danct12@disroot.org>
# Contributor: Bart Ribbers <bribbers@disroot.org>

_pkgver_images_system="17.1-20211007"
_pkgver_images_vendor="17.1-20211007"
pkgname=waydroid-image
pkgver="${_pkgver_images_system//-/_}"
pkgrel=1
pkgdesc="A container-based approach to boot a full Android system on a regular Linux system (Android image)"
arch=('x86_64' 'i686' 'armv7h' 'aarch64')
license=('Apache')
url='https://github.com/waydroid'
depends=('waydroid')
source_i686=(https://sourceforge.net/projects/waydroid/files/images/system/lineage/waydroid_x86/lineage-$_pkgver_images_system-VANILLA-waydroid_x86-system.zip
  https://sourceforge.net/projects/waydroid/files/images/vendor/waydroid_x86/lineage-$_pkgver_images_vendor-MAINLINE-waydroid_x86-vendor.zip)
source_x86_64=(https://sourceforge.net/projects/waydroid/files/images/system/lineage/waydroid_x86_64/lineage-$_pkgver_images_system-VANILLA-waydroid_x86_64-system.zip
  https://sourceforge.net/projects/waydroid/files/images/vendor/waydroid_x86_64/lineage-$_pkgver_images_vendor-MAINLINE-waydroid_x86_64-vendor.zip)
source_armv7h=(https://sourceforge.net/projects/waydroid/files/images/system/lineage/waydroid_arm/lineage-$_pkgver_images_system-VANILLA-waydroid_arm-system.zip
  https://sourceforge.net/projects/waydroid/files/images/vendor/waydroid_arm/lineage-$_pkgver_images_vendor-MAINLINE-waydroid_arm-vendor.zip)
source_aarch64=(https://sourceforge.net/projects/waydroid/files/images/system/lineage/waydroid_arm64/lineage-$_pkgver_images_system-VANILLA-waydroid_arm64-system.zip
  https://sourceforge.net/projects/waydroid/files/images/vendor/waydroid_arm64/lineage-$_pkgver_images_vendor-MAINLINE-waydroid_arm64-vendor.zip)

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

sha256sums_x86_64=('fd02fbdd5ca57a89fb13a496859dac9b21a98331105e4dc2f0a3e6f1ac200f3c'
                   '417b857732463fc05f0c1224e2f07487eeb3952246be12f65c000a1c945dd49b')
sha256sums_i686=('1f395ccd3cd1773d4f03fa84ef19281a45bca2a5d075e1670b860f7887019c01'
                 '6773317993c5e3ab89af98570a655b16bb1249f1400d9211ef58d51992baa7c3')
sha256sums_armv7h=('9c71fce2e76f9271a6c04675694e8a7359e2b13f66c2369a80f2e05a93eb4d2d'
                   '82db5f7e7176140a26ef23535ac924b8b6cb8ff59d7f8b11bf6a4897daa9e73a')
sha256sums_aarch64=('e657e10b148c23f820dd049d7f2b6f97171c9ca32f5b504018ccf44ef5b01b9e'
                    '49892c9d0ed24ff72699cc7a94ecaa01f3271c092665c674cd0ebf011e454750')

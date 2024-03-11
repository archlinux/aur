# Maintainer: farwayer <farwayer@gmail.com>
# Co-maintainer: Markus Hartung (harre) <mail@hartmark.se>
# Contributer: Danct12 <danct12@disroot.org>
# Contributor: Bart Ribbers <bribbers@disroot.org>

_pkgver_images_system="18.1-20240309"
_pkgver_images_vendor="18.1-20240309"

_pkgver_images_system_x86="18.1-20240309"
_pkgver_images_vendor_x86="18.1-20240309"

_pkgver_images_system_arm64="18.1-20240309"
_pkgver_images_vendor_arm64="18.1-20240309"

_pkgver_images_system_arm="18.1-20240309"
_pkgver_images_vendor_arm="18.1-20240309"

pkgname=waydroid-image-gapps
pkgver="${_pkgver_images_system//-/_}"
pkgrel=1
pkgdesc="A container-based approach to boot a full Android system on a regular Linux system (Android image, GAPPS)."
arch=('x86_64' 'i686' 'armv7h' 'aarch64')
license=('Apache')
url='https://github.com/waydroid'
optdepends=('waydroid')
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

sha256sums_x86_64=('60051e4916c1a0a2686ba332fa4b9f2d2b7230b5519965dd6b3d9e3a67578949'
                   '7dfbf9e85ba03f8501e31a8ddfa2d2b97364f829e841a83d53fb6b2c1b492f63')
sha256sums_i686=('29556fb4e9e425e366d716acb3055980fee120bae88867740fe34baca5ba259d'
                 '0e2c30ced870fbb287f33d2301f0e006f5e51d1bc454474e0b4a0454ba1a2b7b')
sha256sums_armv7h=('0b88fb6cf6ec418cb5897ed74fabe9c7adad39be90511144ec068226484f034d'
                   'b94edc2a8993347b72969e66dd19b4dd6bde7164d3d60b1045776b6eb9938c81')
sha256sums_aarch64=('220d3ea4fd342a68bdaeb35dd4750ff1738c0aea42303eba7f4ce5d917bd3106'
                    'd984016eda51284c787ce1fde9755df8fc0aa11ba3a3cc2992b99418c4a1b61e')

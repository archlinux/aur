# Maintainer: farwayer <farwayer@gmail.com>
# Co-maintainer: Markus Hartung (harre) <mail@hartmark.se>
# Contributer: Danct12 <danct12@disroot.org>
# Contributor: Bart Ribbers <bribbers@disroot.org>

_pkgver_images_system="18.1-20221207"
_pkgver_images_vendor="18.1-20221207"

_pkgver_images_system_x86="18.1-20221207"
_pkgver_images_vendor_x86="18.1-20221207"

_pkgver_images_system_arm64="18.1-20221207"
_pkgver_images_vendor_arm64="18.1-20221206"

_pkgver_images_system_arm="18.1-20221207"
_pkgver_images_vendor_arm="18.1-20221206"

pkgname=waydroid-image-gapps
pkgver="${_pkgver_images_system//-/_}"
pkgrel=2
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

sha256sums_x86_64=('9f9ae4a5e4105364a1bfcda2262e3421e67663e560acf2fe9019dbdc05e64aaf'
                   '267ce0aebe08ac7f0e9c8bdd817aaf407b12e8cfa7bbea3ecf5ea55aae19f13e')
sha256sums_i686=('75de0364d653bf76d789e2ae9571a6138fac805da88da37abf82095a41a8283a'
                 'e7dad262d3bb2c15c3fcb3f28ef3d563cd401318afa20f91aa1cda37532df6bf')
sha256sums_armv7h=('a882f2ab459b45f754191de8f7651718ffd7332909c2bdf9d4e015ad7bc60065'
                   '1c997cc7dc962c1b93896b3d3821d7c2af60096bdacfb6e31ba8b31eceae764b')
sha256sums_aarch64=('3a6fabb8cde159f509c6da34ec211ee7cb2c4b569a03facddadf4039ea35d6e3'
                    '49ec39be0861f729f2c1bcfa777a8912f2e22d73df70dd7fa75582d8729a7319')

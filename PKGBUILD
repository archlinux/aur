# Maintainer: farwayer <farwayer@gmail.com>
# Co-maintainer: Markus Hartung (harre) <mail@hartmark.se>
# Contributer: Danct12 <danct12@disroot.org>
# Contributor: Bart Ribbers <bribbers@disroot.org>

_pkgver_images_system="18.1-20230325"
_pkgver_images_vendor="18.1-20230325"

_pkgver_images_system_x86="18.1-20230325"
_pkgver_images_vendor_x86="18.1-20230325"

_pkgver_images_system_arm64="18.1-20230325"
_pkgver_images_vendor_arm64="18.1-20230325"

_pkgver_images_system_arm="18.1-20230325"
_pkgver_images_vendor_arm="18.1-20230325"

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

sha256sums_x86_64=('81c10a4ebd274fe7f102affc1b9ef0cd38cccb502fff4224602c9b40ac7fb397'
                   '00ce9c2493ba3d0a454d312a0b4bea947c713ec8652fe66603caceb45658e9c6')
sha256sums_i686=('1325d53ac47479be0335b105cd9db2e70642ffb163b6644cc4cfcccc74e6749a'
                 'd012fb0663324d51491d13f2f6786bbcdc9790c415bda0c0ea868f6bd22e651e')
sha256sums_armv7h=('11227aa5ac1efa4026328b2943e5c5335d0b578f203ca264974642b7a869df69'
                   '06b5e97cd4cc66d299386bdeea1e65317329435845df4dd27ca5618af191fb04')
sha256sums_aarch64=('1064a85df0de99e442b430d6dcdbe8aa535f64c2c0b238d86e2de7881d7deafd'
                    '98720578c9d45bfe333f38a14c18cdbdac53710805951d9862f14e453f3b8a06')

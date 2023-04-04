# Maintainer: farwayer <farwayer@gmail.com>
# Co-maintainer: Markus Hartung (harre) <mail@hartmark.se>
# Contributer: Danct12 <danct12@disroot.org>
# Contributor: Bart Ribbers <bribbers@disroot.org>

_pkgver_images_system="18.1-20230402"
_pkgver_images_vendor="18.1-20230402"

_pkgver_images_system_x86="18.1-20230402"
_pkgver_images_vendor_x86="18.1-20230402"

_pkgver_images_system_arm64="18.1-20230401"
_pkgver_images_vendor_arm64="18.1-20230402"

_pkgver_images_system_arm="18.1-20230401"
_pkgver_images_vendor_arm="18.1-20230401"

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

sha256sums_x86_64=('cd8f7389ac0dbfa0d666eb4acfce08125eb4d77ab03ddd62b99418bcc57f88ff'
                   'b928d31a5dd9750b619dde61fd21ce5914939026ef27c04af72a51b3dddeb78f')
sha256sums_i686=('ec6e9d053bf779658e17f44d09398d59b7a79c759293b000c9841e3f07079391'
                 '9e4a88cec098d2360754a40eb4afae7feef9fb1cc4d01903bab26cb80b4b904b')
sha256sums_armv7h=('c0aae5f62b60d77457521c7b8a37d0d318c510a960dd5051e83b40213f6ba668'
                   '3601192e3e53d19c311d587744c791e9df44da23bca407a35e2899ff415e0c7c')
sha256sums_aarch64=('12b42659f046f9d0680ca25a025eab4eb391db56e680a6b2c23d6d4cf3b156ca'
                    'b83b5bd2649eaa41b8ddf3cf5415378c5021306c56246e98aa3c59895ece7868')

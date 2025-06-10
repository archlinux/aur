# Maintainer: farwayer <farwayer@gmail.com>
# Co-maintainer: Markus Hartung (harre) <mail@hartmark.se>
# Contributer: Danct12 <danct12@disroot.org>
# Contributor: Bart Ribbers <bribbers@disroot.org>

_pkgver_images_system="20.0-20250607"
_pkgver_images_vendor="20.0-20250607"

_pkgver_images_system_x86="20.0-20250607"
_pkgver_images_vendor_x86="20.0-20250607"

_pkgver_images_system_arm64="20.0-20250607"
_pkgver_images_vendor_arm64="20.0-20250607"

_pkgver_images_system_arm="20.0-20250607"
_pkgver_images_vendor_arm="20.0-20250607"

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

sha256sums_x86_64=('b1b472546f315786a86056bce421ece3851a27cc785030c5365c01e00e11ddf3'
                   'b10c64bc0b421f86839de5e610b2089bc8fc2fa8970163342ce4d0d959ff824d')
sha256sums_i686=('a4a58a6f15bce5586fde7499e2440111d0a23cedfb66435c4767e5eff656b9ff'
                 'e3e1bd9d9e73521f1deea445cc5aae95a3fca74c79247bbe6a8a2bbb4d17337a')
sha256sums_armv7h=('9886134911733970cc2512d005229a59987578e62d83ed830058fc230e0b0b1b'
                   '5dd71fa513f88eb4db2b6a2657057b2e3bca40359952f4ac5f384c2b0cb2202b')
sha256sums_aarch64=('2c64655f3f39bf9d554ccd1297bd473963a4beff16af3c24d0fc4b89d485c2fe'
                    '120c30311554cff26374402597df864485a304c3e4410dd2092d06a6529507be')

# Maintainer: farwayer <farwayer@gmail.com>
# Co-maintainer: Markus Hartung (harre) <mail@hartmark.se>
# Contributer: Danct12 <danct12@disroot.org>
# Contributor: Bart Ribbers <bribbers@disroot.org>

_pkgver_images_system="18.1-20221030"
_pkgver_images_system_x86="18.1-20221030"
_pkgver_images_system_arm="18.1-20221030"
_pkgver_images_system_arm64="18.1-20221030"
_pkgver_images_vendor="18.1-20221105"
_pkgver_images_vendor_x86="18.1-20221105"
_pkgver_images_vendor_arm="18.1-20221105"
_pkgver_images_vendor_arm64="18.1-20221105"
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
  https://sourceforge.net/projects/waydroid/files/images/vendor/waydroid_x86/lineage-$_pkgver_images_vendor_x86-HALIUM_11-waydroid_x86-vendor.zip)
source_x86_64=(https://sourceforge.net/projects/waydroid/files/images/system/lineage/waydroid_x86_64/lineage-$_pkgver_images_system-GAPPS-waydroid_x86_64-system.zip
  https://sourceforge.net/projects/waydroid/files/images/vendor/waydroid_x86_64/lineage-$_pkgver_images_vendor-HALIUM_11-waydroid_x86_64-vendor.zip)
source_armv7h=(https://sourceforge.net/projects/waydroid/files/images/system/lineage/waydroid_arm/lineage-$_pkgver_images_system_arm-GAPPS-waydroid_arm-system.zip
  https://sourceforge.net/projects/waydroid/files/images/vendor/waydroid_arm/lineage-$_pkgver_images_vendor_arm-HALIUM_11-waydroid_arm-vendor.zip)
source_aarch64=(https://sourceforge.net/projects/waydroid/files/images/system/lineage/waydroid_arm64/lineage-$_pkgver_images_system_arm64-GAPPS-waydroid_arm64-system.zip
  https://sourceforge.net/projects/waydroid/files/images/vendor/waydroid_arm64/lineage-$_pkgver_images_vendor_arm64-HALIUM_11-waydroid_arm64-vendor.zip)

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

sha256sums_x86_64=('2e96a24f2bb24d5b8dd6fe8bc04bdb2f4a467ed6784c912e806d30a161972264'
                   '73aec94db726c33a32cd6b4fc3c3322c066363a8855d14f0897d66ee6540598d')
sha256sums_i686=('99ced90314088ca535c240106d15e279be73fd77d85ce73b88a5394150e12d4f'
                 'f8b8d7830690bca3d42fee8c8b305a68795014a9bc8286be4df90490104c3d08')
sha256sums_armv7h=('b446705b6fce430c7ec56b00516e44ab5a6045aa6f47c3b42cdfc3c3da54d520'
                   '9808cd679e7855aefd7e3da5e04acc6537d4640c801a8c609601a2bfaffa5942')
sha256sums_aarch64=('be93e06b5a84e81059c2b692a80ecbf7fff4d93ff59449e7edb99d8ce53a94d5'
                    '221c6271c2babd315a1fbae885107c3721a0d00d9ff955d6d331833e7535d48d')

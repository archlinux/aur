# Maintainer: Danct12 <danct12@disroot.org>
# Contributor: Bart Ribbers <bribbers@disroot.org>

_pkgver_images_system="17.1-20220316"
_pkgver_images_vendor="17.1-20220419"
pkgname=waydroid-image
pkgver="${_pkgver_images_system//-/_}"
pkgrel=2
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

sha256sums_x86_64=('da8f71739a258a4e65f93b69b735e25c3f9052cce318c4e855510b50ecbb1701'
                   '188d994112ca36790c8653596ecadeffa616b3a330352462240cb1db1e8957af')
sha256sums_i686=('cb04a807717aee6777b53d138493541de22810b11b6aa96d81b5f7c0af57989f'
                 'ac68ae2381794d40565127b9853bb54a21e20d74092a599bc97de0bbf7c55871')
sha256sums_armv7h=('a2171307fbb1492907a4730eac2c75004d26c3a628f6baa91889c550a5a4c3b1'
                   '623d0d6c32fe4e7bc14453f92715451ffff6f8b38c554452127d85e2ff17976b')
sha256sums_aarch64=('bd7982ada0530f9478f9afccb8351e74123ac39e91de7c962ab0d4ea7c211e29'
                    'c36b2b9b6c66199d5ef599d599bf79e6db3ed7b72a7e551278fa95f7a36ceb3c')

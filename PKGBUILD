# Maintainer: dangerdev <dangerdev@disroot.org>
# Contributor: Danct12 <danct12@disroot.org>
# Contributor: Bart Ribbers <bribbers@disroot.org>

_pkgver_images_system="18.1-20230120"
_pkgver_images_system_x86="18.1-20230120"
_pkgver_images_system_arm="18.1-20230119"
_pkgver_images_system_arm64="18.1-20230119"
_pkgver_images_vendor="18.1-20230120"
_pkgver_images_vendor_x86="18.1-20230120"
_pkgver_images_vendor_arm="18.1-20230119"
_pkgver_images_vendor_arm64="18.1-20230120"
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

sha256sums_x86_64=('3d81ca82451c1cb4dbce64cc142acb49750e2a109448356810ad8477abb662f7'
                   '06b906344cac368bb4cbeafa01196cd59d49526e646b816919a6abec990673e7')
sha256sums_i686=('a3504fd3cfabae8806cc0aa7b0ce08fff5b8201eb48f908a2b3fb7d9a988e64b'
                 'a26abe5bbe209df4749206c0124f9171f9af4f042179de52205d58f7cf6f4c56')
sha256sums_armv7h=('5b355a3179f86aad716248e50ed5a8231f24cb3bac9db44a6345ab5b34947dcd'
                   'fe2cd7b7d1a28421490ca19fbbfc8a8948a7d9ff6deed80c2d9a0891bd89d5c7')
sha256sums_aarch64=('b71752429e2244dddde5153a7a327196cb53a770f2f80575937519a7db04c37e'
                    '830ced67ec0049f39e2c036f2731137922522a419761708a76ec4bf82b71c6c4')

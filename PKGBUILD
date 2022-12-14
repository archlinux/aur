# Maintainer: Danct12 <danct12@disroot.org>
# Contributor: Bart Ribbers <bribbers@disroot.org>

_pkgver_images_system="18.1-20221210"
_pkgver_images_system_x86="18.1-20221210"
_pkgver_images_system_arm="18.1-20221210"
_pkgver_images_system_arm64="18.1-20221210"
_pkgver_images_vendor="18.1-20221207"
_pkgver_images_vendor_x86="18.1-20221210"
_pkgver_images_vendor_arm="18.1-20221210"
_pkgver_images_vendor_arm64="18.1-20221210"
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

sha256sums_x86_64=('97e22a3986af0227230006115b8c56d5f0240bd020137aa4c6e8f4b494b2c3a7'
                   '267ce0aebe08ac7f0e9c8bdd817aaf407b12e8cfa7bbea3ecf5ea55aae19f13e')
sha256sums_i686=('7e77fe18d8d10886b3671af3ab87b7fe236812ee54f23595932945fea9b986e5'
                 '318f34cf7b6563d2baaeed430b606ea56a62cd00b556451b0c6118bf64991ee0')
sha256sums_armv7h=('06f42ca8ab5fffdb37a27c66ea2a03fd40a78b77eda9a02245d5af244cfa829c'
                   'e23b4b93407c77ebce3c9f340b9e0a650d63993c5da9dcc951babab67a32948c')
sha256sums_aarch64=('425aad0a67cf2a46f02876a2bb698dfa3cf2078120bf648683dd4fe9de84bd3a'
                    '9cc21ccfb54ebfda560737bb02c83209ed7dea342e1198479523ba35a0f577d6')

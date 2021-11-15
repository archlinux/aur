# Maintainer: farwayer <farwayer@gmail.com>
# Contributer: Danct12 <danct12@disroot.org>
# Contributor: Bart Ribbers <bribbers@disroot.org>

_pkgver_images_system="17.1-20211021"
_pkgver_images_system_arm="17.1-20211020"
_pkgver_images_vendor="17.1-20211021"
pkgname=waydroid-image-gapps
pkgver="${_pkgver_images_system//-/_}"
pkgrel=2
pkgdesc="A container-based approach to boot a full Android system on a regular Linux system (Android image, GAPPS)."
arch=('x86_64' 'i686' 'armv7h' 'aarch64')
license=('Apache')
url='https://github.com/waydroid'
depends=('waydroid')
provides=('waydroid-image')
source_i686=(https://sourceforge.net/projects/waydroid/files/images/system/lineage/waydroid_x86/lineage-$_pkgver_images_system-GAPPS-waydroid_x86-system.zip
  https://sourceforge.net/projects/waydroid/files/images/vendor/waydroid_x86/lineage-$_pkgver_images_vendor-MAINLINE-waydroid_x86-vendor.zip)
source_x86_64=(https://sourceforge.net/projects/waydroid/files/images/system/lineage/waydroid_x86_64/lineage-$_pkgver_images_system-GAPPS-waydroid_x86_64-system.zip
  https://sourceforge.net/projects/waydroid/files/images/vendor/waydroid_x86_64/lineage-$_pkgver_images_vendor-MAINLINE-waydroid_x86_64-vendor.zip)
source_armv7h=(https://sourceforge.net/projects/waydroid/files/images/system/lineage/waydroid_arm/lineage-$_pkgver_images_system_arm-GAPPS-waydroid_arm-system.zip
  https://sourceforge.net/projects/waydroid/files/images/vendor/waydroid_arm/lineage-$_pkgver_images_vendor-MAINLINE-waydroid_arm-vendor.zip)
source_aarch64=(https://sourceforge.net/projects/waydroid/files/images/system/lineage/waydroid_arm64/lineage-$_pkgver_images_system-GAPPS-waydroid_arm64-system.zip
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

sha256sums_x86_64=('ebd7c57f32a4b3e39c7e1c2fcd5954d69b3c7bdf78a92bffd5d416173554df19'
                   '99512ed7bcc1190ead02447ba9a716f50eeb64a87135ce15a030475e119464f1')
sha256sums_i686=('dd6987178049801a8a6b5f4962426897e6e9d55480c9fded95279fa7f4bb66ef'
                 'b6a946f7dc81f43a06398179080462623dc348ca2484467571b13b35130be4f9')
sha256sums_armv7h=('800400d7d11710992aa7b5c8adf6811a21be9b20c65569944e1703ca4bd4fa67'
                   '6a743926d80325a5f386472386e848e8948e2f48ead0a3875cb4702b80c561ba')
sha256sums_aarch64=('579a9bc28c2c0f39590105d78b5abf61ac197f3cf3f701a7104c752567bc0fc3'
                    'e4f98d0b7702ccee1caeb8757a9fdc9e7473ff0053dc8326d9b4da72699a5f84')

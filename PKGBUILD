# Maintainer: farwayer <farwayer@gmail.com>
# Co-maintainer: Markus Hartung (harre) <mail@hartmark.se>
# Contributer: Danct12 <danct12@disroot.org>
# Contributor: Bart Ribbers <bribbers@disroot.org>

_pkgver_images_system="18.1-20240316"
_pkgver_images_vendor="18.1-20240316"

_pkgver_images_system_x86="18.1-20240316"
_pkgver_images_vendor_x86="18.1-20240316"

_pkgver_images_system_arm64="18.1-20240316"
_pkgver_images_vendor_arm64="18.1-20240316"

_pkgver_images_system_arm="18.1-20240316"
_pkgver_images_vendor_arm="18.1-20240316"

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

sha256sums_x86_64=('94c3ea658e38d3835065ed6ba93e728ee863c7590d9e2a1c37f6622660b25455'
                   '5961e72f129908818b955c3738400b31e99c5ede14b073c13dde84c3d9e837a9')
sha256sums_i686=('dc5ee80f687c9fe8f400746fba5dca7b4f10f8a9b834639d564ada1b3af3d38a'
                 '6e799f614e8a136ec71ee76c55bbe3e306e141762b94ca6dd813379ac3eda4d6')
sha256sums_armv7h=('f9bb793c6e615d14de12a59d73ab80a502f62647f6bfb0003021188ebbd107c4'
                   '833901a8a3aa68f97a17a559ac0dc28e33df44d6361a58172b7f926461894cf1')
sha256sums_aarch64=('1c02736402924020d3f6551dbb8e834216c87113ef11e63acc54430e967096d2'
                    '502b94e4c57bc7c33087b42eef62db78c85d79d19fc9b0f67e9f3d7dbe84e72b')

# Maintainer: farwayer <farwayer@gmail.com>
# Co-maintainer: Markus Hartung (harre) <mail@hartmark.se>
# Contributer: Danct12 <danct12@disroot.org>
# Contributor: Bart Ribbers <bribbers@disroot.org>

_pkgver_images_system="18.1-20240323"
_pkgver_images_vendor="18.1-20240323"

_pkgver_images_system_x86="18.1-20240323"
_pkgver_images_vendor_x86="18.1-20240323"

_pkgver_images_system_arm64="18.1-20240323"
_pkgver_images_vendor_arm64="18.1-20240323"

_pkgver_images_system_arm="18.1-20240323"
_pkgver_images_vendor_arm="18.1-20240323"

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

sha256sums_x86_64=('98aa42c79fe54aa95c466a3b457d85931d9e3994ac4aa3fdf3c673a17e736388'
                   'c3e3e60350d4870342a140c7b4ca5980ae260cb7836d5abf7817d9a87a582f52')
sha256sums_i686=('a95aefc8c22d648ecf77449ba1c0fca03a46b651bc4de7ecb9437c4a5a8cc786'
                 '397c960d6bf91db4c26f891f9d5150db6e1e2f62f45eec7f3e096d6331ec66c7')
sha256sums_armv7h=('8bae8a8c77d6fb382abfa3d478d56702a7f95f9a1ffd58c6e698b5e5ec759553'
                   'f42680598ffbe5e9f9eed1930fdbcc79b0521d704d6fe0bf93c160c6e9bd078b')
sha256sums_aarch64=('8e0dad7ebaea5a8c8d1cd0ee3567298bd193b5556b4b945813fae5f2d0820ec3'
                    'bdb9ef1ae601646668afebeb60a905de6b95c6fdf38acc0887485121008a7ec2')

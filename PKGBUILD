# Maintainer: farwayer <farwayer@gmail.com>
# Co-maintainer: Markus Hartung (harre) <mail@hartmark.se>
# Contributer: Danct12 <danct12@disroot.org>
# Contributor: Bart Ribbers <bribbers@disroot.org>

_pkgver_images_system="18.1-20230415"
_pkgver_images_vendor="18.1-20230415"

_pkgver_images_system_x86="18.1-20230415"
_pkgver_images_vendor_x86="18.1-20230415"

_pkgver_images_system_arm64="18.1-20230415"
_pkgver_images_vendor_arm64="18.1-20230415"

_pkgver_images_system_arm="18.1-20230415"
_pkgver_images_vendor_arm="18.1-20230415"

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

sha256sums_x86_64=('648db55cfcf81bfe3166750eae8a332f185a29f3332d8f664d7c99442fff10bc'
                   '7c9ecfb27ef3d5ba9b103fbd49a25dbbbfbbb0da4505f39be3d1385e32a0f85a')
sha256sums_i686=('302492c78cc3a22b3c741c20dc8d0478f1e80759060a2bbe44001cec14254091'
                 'bec9bc379c6d3c0a29baff3c4a7d31cdbd1ee3aa710d0dad63bf48e2e934dafd')
sha256sums_armv7h=('915632db461db1f6018f18f7a769fadc912bdb4c204171024a32afcb893831fe'
                   '8e283c3baceec050fc5bcde1be821ae953852589dd01b4bcec1979c24d7c974b')
sha256sums_aarch64=('438340557deeb36d0bd49d0390ac02db1fae732ec54875f37bf1be537cf73b0d'
                    '50adc3a1863b69e3f3c00b61ba1a009be3cc612d3ae4cba75e15fd1dba265f21')

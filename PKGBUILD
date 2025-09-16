# Maintainer: farwayer <farwayer@gmail.com>
# Co-maintainer: Markus Hartung (harre) <mail@hartmark.se>
# Contributer: Danct12 <danct12@disroot.org>
# Contributor: Bart Ribbers <bribbers@disroot.org>

_system="20.0-20250809"
_vendor="20.0-20250809"

_system_x86="20.0-20250823"
_vendor_x86="20.0-20250809"

_system_arm64="20.0-20250809"
_vendor_arm64="20.0-20250809"

_system_arm="20.0-20250823"
_vendor_arm="20.0-20250809"

_all=(
  "$_system"
  "$_vendor"
  "$_system_x86"
  "$_vendor_x86"
  "$_system_arm64"
  "$_vendor_arm64"
  "$_system_arm"
  "$_vendor_arm"
)
_latest="$(printf '%s\n' "${_all[@]}" | sort -V | tail -n1)"
_sf="https://sourceforge.net/projects/waydroid/files/images"

pkgname=waydroid-image-gapps
pkgver="${_latest//-/_}"
pkgrel=1
pkgdesc="A container-based approach to boot a full Android system on a regular Linux system (Android image, GAPPS)."
arch=('x86_64' 'i686' 'armv7h' 'aarch64')
license=('Apache')
url='https://github.com/waydroid'
optdepends=('waydroid')
provides=('waydroid-image')
source_x86_64=(
  $_sf/system/lineage/waydroid_x86_64/lineage-$_system-GAPPS-waydroid_x86_64-system.zip
  $_sf/vendor/waydroid_x86_64/lineage-$_vendor-MAINLINE-waydroid_x86_64-vendor.zip
)
source_i686=(
  $_sf/system/lineage/waydroid_x86/lineage-$_system_x86-GAPPS-waydroid_x86-system.zip
  $_sf/vendor/waydroid_x86/lineage-$_vendor_x86-MAINLINE-waydroid_x86-vendor.zip
)
source_armv7h=(
  $_sf/system/lineage/waydroid_arm/lineage-$_system_arm-GAPPS-waydroid_arm-system.zip
  $_sf/vendor/waydroid_arm/lineage-$_vendor_arm-MAINLINE-waydroid_arm-vendor.zip
)
source_aarch64=(
  $_sf/system/lineage/waydroid_arm64/lineage-$_system_arm64-GAPPS-waydroid_arm64-system.zip
  $_sf/vendor/waydroid_arm64/lineage-$_vendor_arm64-MAINLINE-waydroid_arm64-vendor.zip
)

package() {
  install -Dm644 "$srcdir"/*.img -t "$pkgdir/usr/share/waydroid-extra/images"
}

sha256sums_x86_64=('0c5ef97e6aafa44e1775dd553339bd49991c99c3989550cc74197d6de51f6c4e'
                   '14df3ffc773a30c2c157fa6f97e6c79338990b60ac85d69559bbfb82772650ef')
sha256sums_i686=('8e3ffa0b4ace649b0fd0a59592abf0bc4c0331b6beed95b01bb11d62ebb7d102'
                 '77f5b7054f845c400246ad0b0764da3c6e4f87ade5abc040d81534eb9559f129')
sha256sums_armv7h=('269eb19ff5665c57ee32f2a784e338726f649c093c93cefc2bb9d3410fca3ff0'
                   '311cff66435a5c41ea208473a3ec668ec617042eda7a94899de9a26f301b0577')
sha256sums_aarch64=('cd0a67945e558e43e3d088e7f3f5d5d6faaad29efafc6790a9d852d8bb9b7cc1'
                    'da43b4a822d6951e2c6ee4c18e59ce2f44b505d70a0e942c3a99c9b39345e59c')

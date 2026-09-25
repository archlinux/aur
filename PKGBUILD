# Maintainer: Mr.Zero88 <huesmann.mats+aur@gmail.com>

pkgname=steamvr-linux-fixes-layer-bin
pkgver=0.2.0
pkgrel=1
pkgdesc="A Vulkan layer that patches SteamVR's vrcompositor to address issues for wired headsets"
arch=('x86_64')
url="https://github.com/BnuuySolutions/SteamVRLinuxFixes"
license=('MIT')
source=(
  "$pkgname-$pkgver.zip::https://github.com/BnuuySolutions/SteamVRLinuxFixes/releases/download/v$pkgver/VK_LAYER_BNUUY_steamvr_linux_fixes.zip"
)
sha256sums=(
  '2c71c33d5bb5732f90e4ccedd32d34b168a10ce117806e2acc6a01fcd216530e'
)

package() {  
  install -d "$pkgdir/usr/share/vulkan/implicit_layer.d"
  install -m755 "$srcdir/VkLayer_steamvr_linux_fixes.json" "$pkgdir/usr/share/vulkan/implicit_layer.d/VkLayer_steamvr_linux_fixes.json"
  install -d "$pkgdir/usr/lib/"
  install -m755 "$srcdir/libsteamvr_linux_fixes.so" "$pkgdir/usr/lib/libsteamvr_linux_fixes.so"
}

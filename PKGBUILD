# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=fastfetch-bin
pkgver=2.0.5
pkgrel=1
pkgdesc="Like neofetch, but much faster because written in C."
arch=('x86_64')
url="https://github.com/LinusDierheimer/fastfetch"
license=('MIT')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=('sh' 'glibc')
optdepends=(
  'chafa: Image output as ascii art'
  'dbus: Bluetooth, Player & Media detection'
  'dconf: Needed for values that are only stored in DConf + Fallback for GSettings'
  'glib2: Output for values that are only stored in GSettings'
  'imagemagick: Image output using sixel or kitty graphics protocol'
  'libnm: Used for Wifi detection'
  'libpulse: Used for Sound detection'
  'mesa: Needed by the OpenGL module for gl context creation.'
  'libxrandr: Multi monitor support'
  'ocl-icd: OpenCL module'
  'pciutils: GPU output'
  'vulkan-icd-loader: Vulkan module & fallback for GPU output'
  'xfconf: Needed for XFWM theme and XFCE Terminal font'
  'zlib: Faster image output when using kitty graphics protocol'
)
source=("${pkgname%-bin}-${pkgver}.tar.gz::${url}/releases/download/${pkgver}/${pkgname%-bin}-${pkgver}-Linux.tar.gz")
sha256sums=('16bcbfb18d5cceac0199542f79ac7fe19d3cc5ad87673bb69587454793018141')
package() {
    cd "${srcdir}/${pkgname%-bin}-${pkgver}-Linux"
    cp --parents -a usr "${pkgdir}"
    mv "${pkgdir}/usr/share/licenses/${pkgname%-bin}" "${pkgdir}/usr/share/licenses/${pkgname}"
}
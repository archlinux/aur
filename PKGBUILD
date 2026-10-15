# Maintainer: Mahfuz Shaikh <mah3uz@gmail.com>

pkgname=sysman-bin
pkgver=0.1.0
pkgrel=1
pkgdesc='System monitor for Linux: a metrics collector daemon with crash log and history, and a GPUI app (prebuilt)'
arch=('x86_64')
url='https://github.com/mah3uz/sysman'
license=('MIT')
depends=(
  'gcc-libs' 'glibc'
  'iproute2' 'fontconfig'
  'libxcb' 'libxkbcommon' 'libxkbcommon-x11' 'libxau' 'libxdmcp'
  'wayland' 'libglvnd' 'vulkan-icd-loader'
)
optdepends=(
  'nvidia-utils: NVIDIA GPU metrics through NVML'
  'smartmontools: SATA drive health'
)
provides=('sysman')
conflicts=('sysman')
install=sysman.install
source_x86_64=("$url/releases/download/v$pkgver/sysman-$pkgver-x86_64.tar.gz")
sha256sums_x86_64=('7cb0b6a2f8effb926c599d1aad0cc66d9459ad95b19974e97f77bd437bda9505')

package() {
  cp -a "sysman-$pkgver-x86_64/usr" "$pkgdir/"
  mv "$pkgdir/usr/share/licenses/sysman" "$pkgdir/usr/share/licenses/$pkgname"
  mv "$pkgdir/usr/share/doc/sysman" "$pkgdir/usr/share/doc/$pkgname"
}

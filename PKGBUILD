# Maintainer: Mahfuz Shaikh <mah3uz@gmail.com>

pkgname=sysman-bin
pkgver=0.2.0
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
source_x86_64=("$url/releases/download/v$pkgver/sysman-$pkgver-arch-x86_64.tar.gz")
sha256sums_x86_64=('140ec4dd48f36bad335c7cc86a3f35e6e6c10e597c5fc8589821ef4112836695')

package() {
  cp -a "sysman-$pkgver-arch-x86_64/usr" "$pkgdir/"
  mv "$pkgdir/usr/share/licenses/sysman" "$pkgdir/usr/share/licenses/$pkgname"
  mv "$pkgdir/usr/share/doc/sysman" "$pkgdir/usr/share/doc/$pkgname"
}

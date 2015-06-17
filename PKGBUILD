# Maintainer: Anatol Pomozov <anatol.pomozov@gmail.com>

pkgname=linux-tegra
pkgver=19.3.0
pkgrel=1
pkgdesc='A computer program that allows device makers and hardware developers to interact at a low level (read/write/erase/repartition/reformat) with the storage (e.g. eMMC) connected to the NVIDIA Tegra chip on a low level from a connected PC'
arch=(x86_64)
license=(NVIDIA)
depends=(lib32-glibc lib32-gcc-libs) # mkbootimg is 32-bit binary
url='https://developer.nvidia.com/linux-tegra'
source=(https://developer.nvidia.com/sites/default/files/akamai/mobile/files/L4T/Tegra124_Linux_R${pkgver}_armhf.tbz2)
sha1sums=('a1b9834b5d241debcfa330cf3eababe35faa8dbf')

package() {
  install -dm755 "$pkgdir"/usr/{bin,share}
  cp -r Linux_for_Tegra "$pkgdir"/usr/share/$pkgname
  ln -s /usr/share/$pkgname/bootloader/{mkbootimg,nvflash} "$pkgdir"/usr/bin/
}

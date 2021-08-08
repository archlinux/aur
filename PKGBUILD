# Maintainer: katoitalia
# Contributor: yw662
# Contributor: FabioLolix
# Contributor: aorth for his check-firmware-version.sh

pkgname=intel-ucode-clear
pkgver=34870
pkgrel=1
pkgdesc='Intel cpu microcode and i915 firmware used by Clear Linux'
arch=(x86_64)
url='https://clearlinux.org/'
license=()
provides=(intel-ucode)
_ucode=81710c000616de17cc41a095796cff930ef67fd667f5fade46bb743b0d3efad4
_i915=4569c17b0029817b927247e38e58f7dfaf97e31fce2418d290c00531d6fb4b08
source=('34870-Manifest.linux-firmware::https://cdn.download.clearlinux.org/update/34870/Manifest.linux-firmware'
        '34870-00-intel-ucode.cpio.tar::https://cdn.download.clearlinux.org/update/34870/files/81710c000616de17cc41a095796cff930ef67fd667f5fade46bb743b0d3efad4.tar'
        '34870-i915-firmware.cpio.xz.tar::https://cdn.download.clearlinux.org/update/34870/files/4569c17b0029817b927247e38e58f7dfaf97e31fce2418d290c00531d6fb4b08.tar')
sha256sums=('f5aa82c93f97f6c922a03497dea06a85b1c05c68740858445c33f2597ca0a6ad'
            'e46298bb87db84fd8144fc625ebaf7e5c8e11148807b468a86d98f37113daff7'
            'bde496b06c7ee3d28aab1363d226b88485386ae87f90249b530c850b2b322cdb')

build() {
  mv '81710c000616de17cc41a095796cff930ef67fd667f5fade46bb743b0d3efad4.tar' intel-ucode.cpio
  mv '4569c17b0029817b927247e38e58f7dfaf97e31fce2418d290c00531d6fb4b08.tar' i915-firmware.cpio.xz
}
package() {
  install -d '${pkgdir}'/boot
  install -D {intel-ucode.cpio,i915-firmware.cpio.xz} '${pkgdir}'/boot
}

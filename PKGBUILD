# Maintainer: Nicolas Stalder <n+archlinux@stalder.io>

# BUILD INSTRUCTIONS
#
# The source for `elftosb` is available behind a login wall.
# Visit <https://www.nxp.com/webapp/Download?colCode=elftosb_5.1.19&appType=license>,
# accept the license terms, and place the downloaded ZIP file in the same directory as this PKGBUILD,
# then try building again.

pkgname=elftosb-bin
_pkgname=elftosb
pkgver=5.1.19
pkgrel=1
pkgdesc="ELF to Secure Binary Utility for NXP MCUs"
url="https://www.nxp.com/design/software/development-software/mcuxpresso-software-and-tools-/mcuboot-mcu-bootloader-for-nxp-microcontrollers:MCUBOOT"
# could also support 32-bit with some more work
arch=(x86_64)
license=(custom:NXP)
depends=()
provides=($_pkgname)
conflicts=($_pkgname)

download_url="https://www.nxp.com/webapp/Download?colCode=${_pkgname}_${pkgver}&appType=license"
DLAGENTS=("file::/usr/bin/echo ${BOLD}${RED} Unable to find %u, please download from ${download_url} and read the PKGBUILD ${ALL_OFF}" $DLAGENTS[@])
source=(file://${_pkgname}_$pkgver.zip)
sha256sums=("c5becbe8905ce4002c4bd351ecb585125cf8090c1ae043b324432598707a5d2b")

package() {
  bin=$srcdir/${_pkgname}_$pkgver/bin/linux/amd64
  install -Dm 755 $bin/elftosb -t $pkgdir/usr/bin
}

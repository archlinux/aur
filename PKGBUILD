# Maintainer: Nicolas Stalder <n+archlinux@stalder.io>

# BUILD INSTRUCTIONS
#
# The source for `blhost` is available behind a login wall.
#
# By default, `nxp-dlagent` is used to fetch, you can avoid the prompts
# by setting `NXP_USERNAME` and `NXP_PASSWORD` for your account.
#
# Alternatively, visit <https://www.nxp.com/webapp/Download?colCode=blhost_2.6.2&appType=license>,
# accept the license terms, and place the downloaded ZIP file in the same directory as this PKGBUILD.

pkgname=blhost-bin
_pkgname=blhost
pkgver=2.6.2
pkgname_pkgver=${_pkgname}_$pkgver
pkgrel=2
pkgdesc="Bootloader Host Application for NXP MCUs"
url="https://www.nxp.com/design/software/development-software/mcuxpresso-software-and-tools-/mcuboot-mcu-bootloader-for-nxp-microcontrollers:MCUBOOT"
# could also support 32-bit with some more work
arch=(x86_64)
license=(custom:NXP)
makedepends=(nxp-dlagent)
depends=()
provides=($_pkgname)
conflicts=($_pkgname)

DLAGENTS=("nxp::/usr/bin/nxp-dl %u")
source=("blhost_2.6.2.zip"::"nxp://blhost_2.6.2")
sha256sums=("2e7aa1aa430fbbe01093412f97d618e1773ea40f2f6f24ffcc1e26102d36eb2b")

package() {
  bin=$srcdir/$pkgname_pkgver/bin/linux/amd64
  install -Dm 755 $bin/$_pkgname -t $pkgdir/usr/bin
}

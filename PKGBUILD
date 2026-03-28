# Maintainer: Edward Pacman <edward at edward-p dot xyz>
# Contributor: dreieck <oid-maps at seznam dot cz>

pkgname=wimboot-bin
pkgver=2.9.0
pkgrel=1
pkgdesc="iPXE kernel to boot wim images from network for both UEFI and BIOS system"
arch=(any)
url="https://github.com/ipxe/wimboot"
license=('GPL-2.0-or-later')
makedepends=()
provides=("wimboot=${pkgver}")
conflicts=(wimboot wimboot-git)
optdepends=("ipxe-git: iPXE network boot program")
install=wimboot.install
source=(
  "wimboot-${pkgver}::https://github.com/ipxe/wimboot/releases/download/v${pkgver}/wimboot"
  "wimboot.i386-${pkgver}::https://github.com/ipxe/wimboot/releases/download/v${pkgver}/wimboot.i386")
sha256sums=('abe92880c0208b608cdc0f94e903b8b727d554b70d700606ad0484971713f870'
            '21e11e4e2c505f8f6744417f56ec0f21bfd4d988c60c208cf07d3255f7a63c93')

package() {
	cd "$srcdir"
	for _a in wimboot wimboot.i386; do
		install -Dm755 "$_a-${pkgver}" "$pkgdir/usr/share/wimboot/$_a"
	done
}

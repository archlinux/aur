# Maintainer: Edward Pacman <edward at edward-p dot xyz>
# Contributor: dreieck <oid-maps at seznam dot cz>

pkgname=wimboot-bin
pkgver=2.8.0
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
sha256sums=('74d4bf3d09386ccbbe907d9db59030f8cd8c88f7b4ccb799d386f31def11b3fe'
            '3cdb8b2415f166366df111e507a2151bb3652a90291cc8e824c57c0374bdd54e')

package() {
	cd "$srcdir"
	for _a in wimboot wimboot.i386; do
		install -Dm755 "$_a-${pkgver}" "$pkgdir/usr/share/wimboot/$_a"
	done
}

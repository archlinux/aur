# Maintainer: Edward Pacman <edward at edward-p dot xyz>

pkgname=wimboot-bin
pkgver=2.7.4
pkgrel=1
pkgdesc="iPXE kernel to boot wim images from network for both UEFI and BIOS system"
arch=(any)
url="https://github.com/ipxe/wimboot"
license=('GPL')
makedepends=()
conflicts=(wimboot-git)
optdepends=("ipxe-git: iPXE network boot program"
	"ipxe-netboot: Alternative iPXE network boot program, with Archlinux network install support")
install=wimboot.install
source=(
  "wimboot::https://github.com/ipxe/wimboot/releases/download/v${pkgver}/wimboot"
  "wimboot.i386::https://github.com/ipxe/wimboot/releases/download/v${pkgver}/wimboot.i386"
  )
sha256sums=('2a62a7362df29f35d12a3d7a69fe5d8bbcd5c49a244d12ff00f8a1e4eb0744e0'
            '9a819667ddd52ff46678c7782f5ccf2faaf625b1f15f0fe753962eda8d5292a1')

package() {
	cd "$srcdir"
	for a in wimboot wimboot.i386; do
		install -Dm755 $a $pkgdir/usr/share/wimboot/$a
	done
}

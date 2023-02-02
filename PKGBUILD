# Maintainer: Edward Pacman <edward at edward-p dot xyz>

pkgname=wimboot-bin
pkgver=2.7.5
pkgrel=1
pkgdesc="iPXE kernel to boot wim images from network for both UEFI and BIOS system"
arch=(any)
url="https://github.com/ipxe/wimboot"
license=('GPL')
makedepends=()
conflicts=(wimboot-git)
optdepends=("ipxe-git: iPXE network boot program")
install=wimboot.install
source=(
  "wimboot::https://github.com/ipxe/wimboot/releases/download/v${pkgver}/wimboot"
  "wimboot.i386::https://github.com/ipxe/wimboot/releases/download/v${pkgver}/wimboot.i386"
  )
sha256sums=('7083f2ea6bb8f7f0801d52d38e6ba25d6e46b0e5b2fb668e65dd0720bf33f7bd'
            '1f71b5d55d4b71ff043fe9b451151126a688f1798ed6bc7304f4d563098bba61')

package() {
	cd "$srcdir"
	for a in wimboot wimboot.i386; do
		install -Dm755 $a $pkgdir/usr/share/wimboot/$a
	done
}

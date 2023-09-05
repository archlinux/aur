# Maintainer: Edward Pacman <edward at edward-p dot xyz>

pkgname=wimboot-bin
pkgver=2.7.6
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
sha256sums=('111a6d1cc6a2a2f7b458d81efeb9c5b3f93f7751a0e79371c049555bb474fc85'
            '1c21a014c2d2794696e145e1666baa38672e2f11183a1be6c0398ac29b0f1bfc')

package() {
	cd "$srcdir"
	for a in wimboot wimboot.i386; do
		install -Dm755 $a $pkgdir/usr/share/wimboot/$a
	done
}

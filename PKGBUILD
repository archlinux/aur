# Maintainer: Edward Pacman <edward at edward-p dot xyz>
# Contributor: dreieck <oid-maps at seznam dot cz>

pkgname=wimboot-bin
pkgver=2.9.0
pkgrel=2
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
sha256sums=('5f067ccdc4d084d5bf77b6c853bd0f8402dfc2b4cd1b103d358993ae97fae8e3'
            'b770ad4fa6111d688c062478de3849806b9c3e94a6b770453ef56c94fec254d9')

package() {
	cd "$srcdir"
	for _a in wimboot wimboot.i386; do
		install -Dm755 "$_a-${pkgver}" "$pkgdir/usr/share/wimboot/$_a"
	done
}

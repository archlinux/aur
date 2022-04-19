# Maintainer: threadexio <pzarganitis at gmail dot com>
pkgname=zeus-bin
pkgver=1.2.0
pkgrel=1
pkgdesc="The containerized AUR helper"
url="https://github.com/threadexio/zeus"
arch=('x86_64')
license=('GPL')
depends=('docker')
source=("zeus-bin-${pkgver}.tar.gz::https://github.com/threadexio/zeus/releases/download/v${pkgver}/zeus-bin.tar.gz")
sha256sums=('801e236e3c368c607a60a5ec00609618c856b44cf6398a29f2c24736109e4a60')
conflicts=(zeus podman-docker)

package() {
	cd "$srcdir"

	install -Dm755 -t "$pkgdir/usr/bin" zeus
	install -Dm644 -t "$pkgdir/usr/share/zeus" builder.tar.gz

	mkdir -p "$pkgdir/var/cache/aur"
	chmod 0777 "$pkgdir/var/cache/aur"
}

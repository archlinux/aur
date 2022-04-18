# Maintainer: threadexio <pzarganitis at gmail dot com>
pkgname=zeus-bin
pkgver=1.1.3
pkgrel=1
pkgdesc="The containerized AUR helper"
url="https://github.com/threadexio/zeus"
arch=('x86_64')
license=('GPL')
depends=('docker')
source=("zeus-bin-${pkgver}.tar.gz::https://github.com/threadexio/zeus/releases/download/v${pkgver}/zeus-bin.tar.gz")
sha256sums=('d1b79c8264995427d28f14060496780916ea03f221e16d674c8edad60c46f7b3')
conflicts=(zeus podman-docker)

package() {
	cd "$srcdir"

	install -Dm755 -t "$pkgdir/usr/bin" zeus
	install -Dm644 -t "$pkgdir/usr/share/zeus" builder.tar.gz

	mkdir -p "$pkgdir/var/cache/aur"
	chmod 0777 "$pkgdir/var/cache/aur"
}

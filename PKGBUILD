# Maintainer: threadexio <pzarganitis at gmail dot com>
pkgname=zeus-bin
pkgver=1.1.2
pkgrel=1
pkgdesc="The containerized AUR helper"
url="https://github.com/threadexio/zeus"
arch=('x86_64')
license=('GPL')
depends=('docker')
source=("https://github.com/threadexio/zeus/releases/download/v${pkgver}/zeus-bin.tar.gz")
sha256sums=('d9aab774f576a937063c78c08cfa13dafb948c1e4f5a66308b13377de5a09b2d')
conflicts=(zeus podman-docker)

package() {
	cd "$srcdir"

	install -Dm755 -t "$pkgdir/usr/bin" zeus
	install -Dm644 -t "$pkgdir/usr/share/zeus" builder.tar.gz

	mkdir -p "$pkgdir/var/cache/aur"
	chmod 0777 "$pkgdir/var/cache/aur"
}

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
sha256sums=('78c6fb0def2c84497e6cdc9fb956a060e3951ba5d501c9d153a1303c29e0922f')
conflicts=(zeus podman-docker)

package() {
	cd "$srcdir"

	install -Dm755 -t "$pkgdir/usr/bin" zeus
	install -Dm644 -t "$pkgdir/usr/share/zeus" builder.tar.gz

	mkdir -p "$pkgdir/var/cache/aur"
	chmod 0777 "$pkgdir/var/cache/aur"
}

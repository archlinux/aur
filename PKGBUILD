# Maintainer: threadexio <pzarganitis at gmail dot com>
pkgname=zeus-bin
pkgver=1.1.1
pkgrel=1
pkgdesc="The containerized AUR helper"
url="https://github.com/threadexio/zeus"
arch=('x86_64')
license=('GPL')
depends=('docker')
source=("https://github.com/threadexio/zeus/releases/download/v${pkgver}/zeus-bin.tar.gz")
sha256sums=('9a63144e4fa1c7329913b2711772ed69eafc9859fd9817f18b8042d882b908f8')
conflicts=(zeus podman-docker)

package() {
	cd "$srcdir"

	install -Dm755 target/release/zeus "$pkgdir"/usr/bin/zeus
	install -Dm644 builder.tar.gz "$pkgdir"/usr/share/zeus/builder.tar.gz
	mkdir -p "$pkgdir"/var/cache/aur
	chmod 0777 "$pkgdir"/var/cache/aur
}

# Maintainer: threadexio <pzarganitis at gmail dot com>
pkgname=zeus-bin
pkgver=1.0.0
pkgrel=1
pkgdesc="The containerized AUR helper"
url="https://github.com/threadexio/zeus"
arch=('x86_64')
license=('MIT')
depends=('docker')
source=("https://github.com/threadexio/zeus/releases/download/v${pkgver}/zeus-bin.zip")
sha256sums=('bf74db8dc15c5f4257bb33f8bc237e564d1a7282bd96cca5865474e78738b798')
conflicts=(zeus)

package() {
	cd "$srcdir"

	install -Dm755 target/release/zeus "$pkgdir"/usr/bin/zeus
	install -Dm644 builder.tar.gz "$pkgdir"/usr/share/zeus/builder.tar.gz
	mkdir -p "$pkgdir"/var/cache/aur
	chmod 0777 "$pkgdir"/var/cache/aur
}

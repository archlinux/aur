# Maintainer: Igor Tolmachev <me@igorek.dev>
pkgname=v2rs-bin
pkgver=0.7.0
pkgrel=1
pkgdesc="A small CLI for managing xray proxy"
arch=('x86_64')
url="https://git.igorek.dev/igorechek06/v2rs"
license=('GPL-3.0-or-later')
depends=('xray-bin' 'iproute2')
provides=("v2rs=$pkgver")
conflicts=('v2rs')
source_x86_64=("$pkgname-$pkgver-x86_64.tar.gz::$url/releases/download/v$pkgver/linux-x86-64.tar.gz")
sha256sums_x86_64=('ac4e9e0c86a6779bb248b0aad89eefc2ffe4fcb4a20eb2f569e489a98f5e9519')

package() {
	install -Dm755 "$srcdir/v2rs" "$pkgdir/usr/bin/v2rs"
	install -Dm644 "$srcdir/v2rs.service" "$pkgdir/usr/lib/systemd/system/v2rs.service"
}

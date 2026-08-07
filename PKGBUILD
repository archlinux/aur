# Maintainer: Igor Tolmachev <me@igorek.dev>
pkgname=v2rs-bin
pkgver=0.5.3
pkgrel=1
pkgdesc="A small CLI for managing xray proxy"
arch=('x86_64')
url="https://git.igorek.dev/igorechek06/v2rs"
license=('GPL-3.0-or-later')
depends=('xray-bin' 'iproute2')
provides=("v2rs=$pkgver")
conflicts=('v2rs')
source_x86_64=("$pkgname-$pkgver-x86_64.tar.gz::$url/releases/download/v$pkgver/linux-x86-64.tar.gz")
sha256sums_x86_64=('489468e1918fa0acc9c4de287306bfcd90417c33854862127da83a44f6b1f160')

package() {
	install -Dm755 "$srcdir/v2rs" "$pkgdir/usr/bin/v2rs"
	install -Dm644 "$srcdir/v2rs.service" "$pkgdir/usr/lib/systemd/system/v2rs.service"
}

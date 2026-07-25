# Maintainer: Igor Tolmachev <me@igorek.dev>
pkgname=v2rs-bin
pkgver=0.5.2
pkgrel=1
pkgdesc="A small CLI for managing xray proxy"
arch=('x86_64')
url="https://git.igorek.dev/igorechek06/v2rs"
license=('GPL-3.0-or-later')
depends=('xray-bin' 'iproute2')
provides=("v2rs=$pkgver")
conflicts=('v2rs')
source_x86_64=("$pkgname-$pkgver-x86_64.tar.gz::$url/releases/download/v$pkgver/linux-x86-64.tar.gz")
sha256sums_x86_64=('2dad4efe60c46531d56427842274ee52e970fa392a6c22c7b4cf473b8dabf5e3')

package() {
	install -Dm755 "$srcdir/v2rs" "$pkgdir/usr/bin/v2rs"
	install -Dm644 "$srcdir/v2rs.service" "$pkgdir/usr/lib/systemd/system/v2rs.service"
}

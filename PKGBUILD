# Maintainer: Francis Agyapong <francisagyapong2 at gmail dot com>

pkgname="nats-server"
pkgdesc="Simple, secure and high performance open source messaging system"
pkgver=2.1.8
pkgrel=1
provides=("${pkgname}")
arch=("x86_64")
url="https://nats.io"
licence=("Apache")
source=("https://github.com/nats-io/nats-server/releases/download/v$pkgver/nats-server-v$pkgver-linux-amd64.zip")
sha256sums=("8ec25475ef1d49bf5e721de38deb11d689d1a9b2fa588540af78d56cbea2b49d")

package() {
	local actual_srcdir="$srcdir/$pkgname-v$pkgver-linux-amd64"

	install -Dm 755 "${actual_srcdir}/nats-server" -t "${pkgdir}/usr/bin"
	install -Dm 644 "../nats-server.service" -t "${pkgdir}/usr/lib/systemd/system"
	install -Dm 644 "${actual_srcdir}/README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}

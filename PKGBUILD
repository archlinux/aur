# Maintainer: Francis Agyapong <francisagyapong2 at gmail dot com>

pkgname="nats-server"
pkgdesc="Simple, secure and high performance open source messaging system"
pkgver=2.0.2
pkgrel=1
provides=("${pkgname}")
arch=("x86_64")
url="https://nats.io"
licence=("Apache")
source=("https://github.com/nats-io/nats-server/releases/download/v$pkgver/nats-server-v$pkgver-linux-amd64.zip")
sha256sums=("71ea574193001b3c40baea57546d2cad132aa5fec81374fd0591ad6a1c66c650")

package() {
	local actual_srcdir="$srcdir/$pkgname-v$pkgver-linux-amd64"

	install -Dm 755 "${actual_srcdir}/nats-server" -t "${pkgdir}/usr/bin"
	install -Dm 644 "../nats-server.service" -t "${pkgdir}/usr/lib/systemd/system"
	install -Dm 644 "${actual_srcdir}/README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}

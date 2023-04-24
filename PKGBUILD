# Maintainer: Francis Agyapong <francisagyapong2 at gmail dot com>

pkgname="nats-server"
pkgdesc="Simple, secure and high performance open source messaging system"
pkgver=2.9.16
pkgrel=1
provides=("${pkgname}")
arch=("x86_64")
url="https://nats.io"
license=("Apache")
source=(
	"https://github.com/nats-io/nats-server/releases/download/v$pkgver/nats-server-v$pkgver-linux-amd64.zip"
	"local://nats-server.service"
)

sha256sums=(
	"51100105ca16c609ab05a12901f1e61b1d997c4ab80c12d722c6d1c0828ab50e"
	"3dcf497f31d8502712773d63801e6aa33416851fcf5e58a504a72c7d105960ce"
)

package() {
	local actual_srcdir="$srcdir/$pkgname-v$pkgver-linux-amd64"

	install -Dm 755 "${actual_srcdir}/nats-server" -t "${pkgdir}/usr/bin"
	install -Dm 644 "${srcdir}/nats-server.service" -t "${pkgdir}/usr/lib/systemd/system"
	install -Dm 644 "${actual_srcdir}/README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}

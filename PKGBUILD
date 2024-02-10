pkgname=pacproxy-bin
pkgver=2.0.5
pkgrel=3
pkgdesc='A no-frills local HTTP proxy server powered by a proxy auto-config (PAC) file'
url=https://github.com/williambailey/pacproxy
arch=(x86_64)
license=(Apache)
install=$pkgname.install
options=(!debug)
source=(pacproxy\_$pkgver\_linux_amd64.tar.gz::$url/releases/download/v$pkgver/pacproxy\_$pkgver\_linux_amd64.tar.gz
	pacproxy.service)
b2sums=(dcae9efaea616187bfa7639beba60221a4b8e6864dbb01e37064a1d0614c636477fd034b3fb65a78fbea2360a5191ba652a4d79ef70be4afe7a4079408e02fbd
	316025d423c89e5f14377bfebd3abdc6b1d9b79064fb2a7386e0934729138d86de8249aefbe38b3fc467905ebb89cd4bda70ccd57ae4885451ac2d74c817cf7e)

package() {
	install -Dm 755 pacproxy\_$pkgver\_linux_amd64/pacproxy $pkgdir/usr/bin/pacproxy
	install -Dm 644 pacproxy.service -t $pkgdir/usr/lib/systemd/system
}

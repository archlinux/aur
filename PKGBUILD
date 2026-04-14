pkgname=pacproxy-bin
pkgver=2.0.6
pkgrel=1
pkgdesc='A no-frills local HTTP proxy server powered by a proxy auto-config (PAC) file'
url=https://github.com/williambailey/pacproxy
arch=(x86_64)
license=(Apache)
install=$pkgname.install
options=(!debug)
source=(pacproxy\_$pkgver\_linux_amd64.tar.gz::$url/releases/download/v$pkgver/pacproxy\_$pkgver\_linux_amd64.tar.gz
	pacproxy.service)
b2sums=(9f9f24c72246131f55497ae70f4b12203b75d4939e6eed7c42a2bee3628770ed3ddaf26e4caf87783dba4bebe40f8cca32dc2fea46bb62c7b67b331396810070
	316025d423c89e5f14377bfebd3abdc6b1d9b79064fb2a7386e0934729138d86de8249aefbe38b3fc467905ebb89cd4bda70ccd57ae4885451ac2d74c817cf7e)

package() {
	install -Dm 755 pacproxy\_$pkgver\_linux_amd64/pacproxy $pkgdir/usr/bin/pacproxy
	install -Dm 644 pacproxy.service -t $pkgdir/usr/lib/systemd/system
}

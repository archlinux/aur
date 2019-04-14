# Contributor: Maxim Devaev <mdevaev@gmail.com>
# Author: Maxim Devaev <mdevaev@gmail.com>


pkgname=kvmd-webterm
pkgver=0.18
pkgrel=1
pkgdesc="Pi-KVM Web Terminal (GoTTY)"
url="https://github.com/pi-kvm/kvmd-webterm"
license=(GPL)
arch=(any)
depends=(kvmd gotty)
makedepends=(go)
install=$pkgname.install
source=(
	$pkgname.install
	$pkgname.service
	terminal.svg
	nginx.ctx-http.conf
	nginx.ctx-server.conf
	index.html
	manifest.yaml
)
md5sums=(SKIP SKIP SKIP SKIP SKIP SKIP SKIP)


package() {
	mkdir -p "$pkgdir/usr/lib/systemd/system"
	install -Dm644 kvmd-webterm.service "$pkgdir/usr/lib/systemd/system/kvmd-webterm.service"

	mkdir -p "$pkgdir/usr/share/kvmd/web/extras/webterm"
	cp terminal.svg "$pkgdir/usr/share/kvmd/web/extras/webterm"

	mkdir -p "$pkgdir/usr/share/kvmd/extras/webterm"
	cp nginx.*.conf index.html manifest.yaml "$pkgdir/usr/share/kvmd/extras/webterm"
}

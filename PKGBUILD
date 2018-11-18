# Contributor: Maxim Devaev <mdevaev@gmail.com>
# Author: Maxim Devaev <mdevaev@gmail.com>


pkgname=kvmd-webterm
pkgver=0.1
pkgrel=1
pkgdesc="Pi-KVM Web Terminal (GoTTY)"
url="https://github.com/pi-kvm/kvmd-webterm"
license=(GPL)
arch=(any)
depends=(kvmd gotty)
makedepends=(go)
install=$pkgname.install


package() {
	install -Dm644 kvmd-webterm.service "$pkgdir/usr/lib/systemd/system/kvmd-webterm.service"
	mkdir -p "$pkgdir/usr/share/kvmd/web/apps/webterm"
	cp -r terminal.svg "$pkgdir/usr/share/kvmd/apps/webterm"
	mkdir -p "$pkgdir/usr/share/kvmd/configs/nginx/apps/webterm"
	cp -r http-ctx.conf server-ctx.conf manifest.json "$pkgdir/usr/share/kvmd/configs/nginx/apps/webterm"
}

# Maintainer: picokan <todaysoracle@protonmail.com>

pkgname=uptime-kuma-runit
pkgver=20241101
pkgrel=1
pkgdesc="Runit service script for uptime-kuma."
arch=("any")
url="https://github.com/louislam/uptime-kuma"
license=("MIT")
depends=( "runit" "uptime-kuma")
source=("uptime-kuma.run" "uptime-kuma.log.run")
sha256sums=('cfedd218efd206ba72d3b71097753581c994ab81c1f3a510fdc04228af310cec'
            'e4a66e777b8fbc2d0369b93538410130b0d3b5c30fb5d4ae80b46cb359a270e4')

package() {
	cd "$srcdir"
	install -Dm755 uptime-kuma.run "$pkgdir/etc/runit/sv/uptime-kuma/run"
	install -Dm755 uptime-kuma.log.run "$pkgdir/etc/runit/sv/uptime-kuma/log/run"
}

# Maintainer: picokan <todaysoracvle@protonmail.com>

pkgname=jellyfin-runit
pkgver=20240313
pkgrel=1
pkgdesc="Runit service script for jellyfin."
arch=("any")
url="https://jellyfin.org"
license=("GPL-2.0")
depends=("jellyfin-server" "runit")
source=("jellyfin.run" "jellyfin.log.run")
sha256sums=('ee6e41967280b1edfd1d0395735f510890a66813492d6ffacb7096117c0faca6'
            'd1cac930ecaec203c6c7beecf7593a275a829dd98a4b74a49434652009f551f5')

package() {
	cd "$srcdir"
	install -Dm755 jellyfin.run "$pkgdir/etc/runit/sv/jellyfin/run"
	install -Dm755 jellyfin.log.run "$pkgdir/etc/runit/sv/jellyfin/log/run"
}

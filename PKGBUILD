# Maintainer: picokan <todaysoracle@protonmail.com>

pkgname=autobrr-runit
pkgver=20240313
pkgrel=1
pkgdesc="Runit service script for autobrr."
arch=("any")
url="https://autobrr.com"
license=("GPL-2.0")
depends=("autobrr" "runit")
source=("autobrr.run" "autobrr.log.run")
sha256sums=('30d058e172b5556d96f3d6bcfa1fac2bb92cdcbbfdb1023d0e991c883c3d5527'
            'd3d0752f547f0f84883cf699196c06f8fbbe1983fbf55deb6738e1a0fb3a523f')

package() {
	cd "$srcdir"
	install -Dm755 autobrr.run "$pkgdir/etc/runit/sv/autobrr/run"
	install -Dm755 autobrr.log.run "$pkgdir/etc/runit/sv/autobrr/log/run"
}

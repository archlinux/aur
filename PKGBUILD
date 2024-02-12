# Maintainer: Loek Le Blansch <loek@pipeframe.xyz>

pkgname=ppd-psn-dp-1820
pkgver=1.0
pkgrel=2
pkgdesc="PPD drivers for Panasonic WORKiO DP-1520P, 1820E and 1820P"
arch=('any')
url="https://panasonic.net/cns/pcc/support/mfp/dp-1820/ps/download.html"
license=('unknown')
depends=('cups')
source=('https://www.psn-web.net/cs/support/mfp/dp-1820/ps/mxae061215.zip')
sha256sums=('7c3ccc9c8e8851aadb46b53108e92813f9b2751d61ce9e5727e2c26f49133b55')
install=psn-dp-1820.install

package() {
	cd "$srcdir/mxae061215"

	target_dir="$pkgdir/usr/share/ppd/Panasonic"
	mkdir -p "$target_dir"
	install -D -m 644 \
		Panasonic_DP-1520P.ppd Panasonic_DP-1820E.ppd Panasonic_DP-1820P.ppd \
		"$target_dir"
}

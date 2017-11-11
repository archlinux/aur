# Maintainer: Stephen Argent <steve [at] tuxcon [dot] com>

pkgname=('byteball')
pkgver=1.11.3
pkgrel=1
pkgdesc="Byteball cryptocurrency wallet client."
arch=('x86_64')
url='byteball.org'
license=('MIT')
source=(https://github.com/${pkgname}/${pkgname}/releases/download/v${pkgver}/byteball-linux64.zip)
sha256sums=('efebc999444135e97b1cf9916862b2707be85726d1f550c49779010dde2705f7')
install="$pkgname.install"
package() {
	unzip -o "${srcdir}/byteball-linux64.zip"
	install -dm755 "$pkgdir/usr/share/byteball"
	install -dm755 "$pkgdir/usr/share/applications"
	install -Dm644 "$srcdir/byteball-linux64/$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
	cp -R ${srcdir}/byteball-linux64/* ${pkgdir}/usr/share/byteball/
	chmod -R o+r "$pkgdir/usr/share/"
	chmod 755 "$pkgdir/usr/share/byteball/Byteball"
}

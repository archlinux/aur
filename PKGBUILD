# Maintainer: Stephen Argent <steve [at] tuxcon [dot] com>

pkgname=('byteball-tn')
pkgver=1.9.1t
pkgrel=2
pkgdesc="Byteball cryptocurrency testnet wallet client."
arch=('x86_64')
url='byteball.org'
license=('MIT')
source=(https://github.com/byteball/byteball/releases/download/v${pkgver}/byteball-tn-linux64.zip)
sha256sums=('1d0f28db0f593299c41c003723c88c11f1df6f3f1e9680b114bb0a06e6cb8042')
install="$pkgname.install"
package() {
	unzip -o "${srcdir}/byteball-tn-linux64.zip"
	install -dm755 "$pkgdir/usr/share/byteball-tn"
	install -dm755 "$pkgdir/usr/share/applications"
	install -Dm644 "$srcdir/byteball-tn-linux64/byteball.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
	cp -R ${srcdir}/byteball-tn-linux64/* ${pkgdir}/usr/share/byteball-tn/
	chmod -R 755 ${pkgdir}/usr/share/byteball-tn/
}

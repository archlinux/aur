# Maintainer: Stephen Argent <steve [at] tuxcon [dot] com>

pkgname=('byteball')
pkgver=1.11.2
pkgrel=1
pkgdesc="Byteball cryptocurrency wallet client."
arch=('x86_64')
url='byteball.org'
license=('MIT')
source=(https://github.com/${pkgname}/${pkgname}/releases/download/v${pkgver}/byteball-linux64.zip)
sha256sums=('fb3a9436b36a1b8e6d86be307e3e018be562555c26d6b20ff77eaddae6259423')
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

# Maintainer: Stephen Argent <steve [at] tuxcon [dot] com>

pkgname=('byteball')
pkgver=2.4.2
pkgrel=1
pkgdesc="Byteball cryptocurrency wallet client."
arch=('x86_64')
url='byteball.org'
license=('MIT')
options=('!strip')
depends=('binutils'
	 'unzip'
	 'freetype2'
	 'nss'
	 'gconf'
	 'fontconfig'
	 'pango'
	 'libxi'
	 'libxcursor'
	 'libxss'
	 'libxcomposite'
	 'alsa-lib'
	 'libxdamage'
	 'libxtst'
	 'atk'
	 'libxrandr'
	 'libcups'
	 'gtk2'
	 'libexif')
source=(https://github.com/${pkgname}/${pkgname}/releases/download/v${pkgver}/byteball-linux64.zip)
sha256sums=('0bf784b55228b115c7772b7677fa35fe230369caf20cdf97ec14f5026822f1e3')
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

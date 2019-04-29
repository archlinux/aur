# Maintainer: Stephen Argent <steve [at] tuxcon [dot] com>

pkgname=('obyte-gui-wallet-bin')
pkgver=2.7.0
pkgrel=1
pkgdesc="Obyte cryptocurrency wallet client."
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
source=(https://github.com/byteball/obyte-gui-wallet/releases/download/v${pkgver}/obyte-linux64.zip)
sha256sums=('f8d286bfb0247a730c4797128712b10c67a19ec4c5e6312c30e903de507b8b83')
install="$pkgname.install"
package() {
	unzip -o "${srcdir}/obyte-linux64.zip"
	install -dm755 "$pkgdir/usr/share/obyte"
	install -dm755 "$pkgdir/usr/share/applications"
	install -Dm644 "$srcdir/obyte-linux64/obyte.desktop" "$pkgdir/usr/share/applications/obyte.desktop"
	cp -R ${srcdir}/obyte-linux64/* ${pkgdir}/usr/share/obyte/
	chmod -R o+r "$pkgdir/usr/share/"
	chmod 755 "$pkgdir/usr/share/obyte/Obyte"
}

# Maintainer: Brian <brian@bamonroe.com>
pkgname=dwarffortress-terminal-fonts
pkgver=1
pkgrel=1
pkgdesc="Provides fonts based on dwarffortress custom tilesets, for use with playing dwarffortress in TEXT mode in a terminal."
arch=(any)
url="http://dffd.bay12games.com/file.php?id=1922"
license=('GPL')
depends=()
makedepends=()
source=('http://dffd.bay12games.com/download.php?id=1922&f=DF+Fonts.zip')
sha256sums=('2fa545d0280e6b2146f2b0c4cf0c5c0bbc61bd8a5aab473c7efd21cfcf711f16')
package() {
	cd "$srcdir/DF Fonts"
	mkdir -p "$pkgdir/usr/share/fonts/DF Fonts"
	cp *.ttf "$pkgdir/usr/share/fonts/DF Fonts"
}

post_install() {
	fc-cache
	echo "Fonts are prefixed by 'DF_'"
}

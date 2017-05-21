# Maintainer: Felix Barz <skycoder42.de@gmx.de>
pkgname=seasonproxer
pkgver=1.0.0
pkgrel=2
pkgdesc="A tool to passivly check for updates on seasons, for proxer.me"
arch=('i686' 'x86_64')
url="https://github.com/Skycoder42/SeasonProxer"
license=('BSD')
depends=('qt5-base' 'qt5-tools' 'qt5-datasync' 'qt5-restclient')
makedepends=('qpm')
source=("https://install.skycoder42.de/pkg/SeasonProxer-${pkgver}.tar.gz")
sha256sums=('e6dd804c162a87c47cb21fffdcd7c8e0df906e9f00f47e5a65dbff8156d2c974')

package() {
	TRANSLATION_DIR=$(qmake -query QT_INSTALL_TRANSLATIONS)

	install -D -m 755 -p SeasonProxer $pkgdir/usr/bin/SeasonProxer
	
	install -D -m 644 -p de.skycoder42.SeasonProxer.desktop $pkgdir/usr/share/applications/de.skycoder42.SeasonProxer.desktop
	install -D -m 644 -p main_48.png "$pkgdir/usr/share/icons/hicolor/48x48/apps/SeasonProxer.png"
	install -D -m 644 -p main_32.png "$pkgdir/usr/share/icons/hicolor/32x32/apps/SeasonProxer.png"
	install -D -m 644 -p main_24.png "$pkgdir/usr/share/icons/hicolor/24x24/apps/SeasonProxer.png"
	install -D -m 644 -p main_22.png "$pkgdir/usr/share/icons/hicolor/22x22/apps/SeasonProxer.png"
	install -D -m 644 -p main_16.png "$pkgdir/usr/share/icons/hicolor/16x16/apps/SeasonProxer.png"
	
	install -D -m 644 -p seasonproxer_core_de.qm "$pkgdir/$TRANSLATION_DIR/seasonproxer_core_de.qm"
	install -D -m 644 -p seasonproxer_desktop_de.qm "$pkgdir/$TRANSLATION_DIR/seasonproxer_desktop_de.qm"
	install -D -m 644 -p seasonproxer_de.qm "$pkgdir/$TRANSLATION_DIR/seasonproxer_de.qm"
}

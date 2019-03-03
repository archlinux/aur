# Maintainer: Jose Galvez <jose@cybergalvez.com>
pkgname=insomnio-git
pkgver=3.0
pkgrel=1
pkgdesc="keeps computer from fallling asleep"
arch=('any')
url="https://bitbucket.org/jjgalvez/insomnio"
license=('PSF')
groups=()
depends=(
	'python'
	'python-pyqt5'
	'python-click'
)
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
replaces=()
backup=()
options=()
install=${pkgname%-git}.install
source=("${pkgname%-git}::git+https://jjgalvez@bitbucket.org/jjgalvez/insomnio.git#tag=$pkgver"
				"${pkgname%-git}.desktop")
noextract=()
sha256sums=('SKIP'
            'd639c8e1ee4f9461c3bd42d6b9f997ddd675678e654c542c9fd67bed59e8f07a')

package() {
	cd ${pkgname%-git}

	install -D -m755 ./insomnio2.py $pkgdir/usr/lib/${pkgname%-git}/insomnio.py
	install -D -m755 ./insomnio_config.py $pkgdir/usr/lib/${pkgname%-git}/insomnio_config.py

	install -D -m644 ./utils.py $pkgdir/usr/lib/${pkgname%-git}/utils.py
	install -D -m644 ./whichos.py $pkgdir/usr/lib/${pkgname%-git}/whichos.py
	install -D -m644 ./config.py $pkgdir/usr/lib/${pkgname%-git}/config.py
	install -D -m644 ./inhibitors.py $pkgdir/usr/lib/${pkgname%-git}/inhibitors.py

	install -D -m644 ./resources/screensaverOn.png $pkgdir/usr/lib/${pkgname%-git}/resources/screensaverOn.png
	install -D -m644 ./resources/screensaverOff.png $pkgdir/usr/lib/${pkgname%-git}/resources/screensaverOff.png
	install -D -m644 ./resources/insomnio128.png $pkgdir/usr/lib/${pkgname%-git}/resources/insomnio128.png
	install -D -m644 ./resources/insomnioOff.png $pkgdir/usr/lib/${pkgname%-git}/resources/insomnioOff.png
	install -D -m644 ./resources/stylesheet.css $pkgdir/usr/lib/${pkgname%-git}/resources/stylesheet.css

	install -D -m644 ./resources/insomnio128.png $pkgdir/usr/share/pixmaps/${pkgname%-git}.png

	install -D -m755 $srcdir/insomnio.desktop $pkgdir/usr/share/applications/insomnio.desktop

}

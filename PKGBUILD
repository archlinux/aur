# Maintainer: Jose Galvez <jose@cybergalvez.com>
pkgname=insomnio-git
pkgver=2.5
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
md5sums=('SKIP'
         '64383f3a8db623185c940d4097b82ed2')

package() {
	cd ${pkgname%-git}

	install -D -m755 ./insomnio.py $pkgdir/usr/lib/${pkgname%-git}/insomnio.py
	install -D -m755 ./insomnio_config.py $pkgdir/usr/lib/${pkgname%-git}/insomnio_config.py

	install -D -m644 ./utils.py $pkgdir/usr/lib/${pkgname%-git}/utils.py
	install -D -m644 ./whichos.py $pkgdir/usr/lib/${pkgname%-git}/whichos.py
	install -D -m644 ./config.py $pkgdir/usr/lib/${pkgname%-git}/config.py
	install -D -m644 ./inhibitors.py $pkgdir/usr/lib/${pkgname%-git}/inhibitors.py

	install -D -m644 ./resources/screensaverOn.png $pkgdir/usr/lib/${pkgname%-git}/resources/screensaverOn.png
	install -D -m644 ./resources/screensaverOff.png $pkgdir/usr/lib/${pkgname%-git}/resources/screensaverOff.png
	install -D -m644 ./resources/insomnio128.png $pkgdir/usr/lib/${pkgname%-git}/resources/insomnio128.png

	install -D -m644 ./resources/insomnio128.png $pkgdir/usr/share/pixmaps/${pkgname%-git}.png

	install -D -m755 $srcdir/insomnio.desktop $pkgdir/usr/share/applications/insomnio.desktop

}

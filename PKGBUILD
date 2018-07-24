# Maintainer: Jose Galvez <jose@cybergalvez.com>
pkgname=insomnio-git
pkgver=1.0
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
source=("${pkgname%-git}::git+https://jjgalvez@bitbucket.org/jjgalvez/insomnio.git#tag=$pkgver")
noextract=()
md5sums=('SKIP')

package() {
	cd ${pkgname%-git}

	install -D -m755 ./insomnio.py $pkgdir/usr/lib/${pkgname%-git}/insomnio.py
	install -D -m755 ./insomnio_config.py $pkgdir/usr/lib/${pkgname%-git}/insomnio_config.py

	install -D -m644 ./utils.py $pkgdir/usr/lib/${pkgname%-git}/utils.py
	install -D -m644 ./config.py $pkgdir/usr/lib/${pkgname%-git}/config.py
	install -D -m644 ./inhibitors.py $pkgdir/usr/lib/${pkgname%-git}/inhibitors.py

	install -D -m644 ./resources/screensaverOn.png $pkgdir/usr/lib/${pkgname%-git}/resources/screensaverOn.png
	install -D -m644 ./resources/screensaverOff.png $pkgdir/usr/lib/${pkgname%-git}/resources/screensaverOff.png
	install -D -m644 ./resources/insomnio128.png $pkgdir/usr/lib/${pkgname%-git}/resources/insomnio128.png

	install -D -m644 ./resources/insomnio128.png $pkgdir/usr/share/pixmaps/${pkgname%-git}.png

	install -D -m755 ./insomnio.desktop $pkgdir/usr/share/applications/insomnio.desktop

}

# Maintainer: Jose Galvez <jose@cybergalvez.com>
pkgname=googleallodesktop-git
pkgver=1.2
pkgrel=1
pkgdesc="QT based Google Allo Desktop app"
arch=('any')
url="https://bitbucket.org/jjgalvez/googleallodesktop"
license=('PSF')
groups=()
depends=(
	'python'
	'python-pyqt5'
)
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
replaces=()
backup=()
options=()
install=
source=("${pkgname%-git}::git+https://jjgalvez@bitbucket.org/jjgalvez/googleallodesktop.git#tag=$pkgver")
noextract=()
md5sums=('SKIP')

package() {
	cd ${pkgname%-git}

	install -D -m755 ./googleAllo.py $pkgdir/usr/lib/${pkgname%-git}/googleAllo.py
	install -D -m644 ./qtwebview.py $pkgdir/usr/lib/${pkgname%-git}/qtwebview.py
	install -D -m644 ./logo_allo_bubble_48dp.png $pkgdir/usr/lib/${pkgname%-git}/logo_allo_bubble_48dp.png
	install -D -m644 ./logo_allo_bubble_48dp.png $pkgdir/usr/share/pixmaps/./logo_allo_bubble_48dp.png
	install -D -m755 ./google-allo.desktop $pkgdir/usr/share/applications/google-allo.desktop

}

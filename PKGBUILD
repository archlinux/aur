# Maintainer: Evan Zhang <aur AT evanzhang.ca>

pkgname=abeluna
pkgver=1.1.3
pkgrel=3
pkgdesc="A simple GUI to-do/task manager with CalDAV support."
arch=('any')
url="https://github.com/Ninjaclasher/abeluna"
license=('AGPL3')
source=(
	"$pkgname-$pkgver.tar.gz"::https://github.com/Ninjaclasher/abeluna/archive/"$pkgver".tar.gz
)
md5sums=('827551c077177933ddfef0c4baeae5ed')
depends=(
	'python-gobject'
	'python-humanize'
	'python-icalendar'
	'python-caldav'
	'libnotify'
	'python-setuptools'
	'python-tzlocal'
)
package() {
	cd "${srcdir}/${pkgname}-${pkgver}" || exit 2
	/usr/bin/python3 setup.py install --prefix=/usr --root="$pkgdir/" --optimize=1
}

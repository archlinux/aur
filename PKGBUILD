# Maintainer: Evan Zhang <aur AT evanzhang.ca>

pkgname=abeluna
pkgver=1.1.2
pkgrel=1
pkgdesc="A simple GUI to-do/task manager with CalDAV support."
arch=('any')
url="https://github.com/Ninjaclasher/abeluna"
license=('AGPL3')
source=(
	"$pkgname-$pkgver.tar.gz"::https://github.com/Ninjaclasher/abeluna/archive/"$pkgver".tar.gz
)
md5sums=('cabdc8ea1a9dbb3ba954852bcc36e16c')
depends=(
	'python-gobject'
	'python-humanize'
	'python-icalendar'
	'python-caldav'
	'libnotify'
	'python-setuptools'
)
package() {
	cd "${srcdir}/${pkgname}-${pkgver}" || exit 2
	/usr/bin/python3 setup.py install --prefix=/usr --root="$pkgdir/" --optimize=1
}

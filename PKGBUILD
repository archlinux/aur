# Maintainer: ROllerozxa <temporaryemail4meh [gee mail]>
# Contributor: Ivy Foster <ivy.foster@gmail.com>
# Contributor: Alexander Rødseth <rodseth@gmail.com>
pkgname='netsurf-buildsystem-git'
pkgver=1.9.r1.g1fbac2b
pkgrel=1
pkgdesc='The Netsurf buildsystem'
url='http://source.netsurf-browser.org/buildsystem.git/'
license=('MIT')

makedepends=('git')
provides=('netsurf-buildsystem')
conflicts=('netsurf-buildsystem')

arch=('x86_64' 'i686')
source=('git://git.netsurf-browser.org/buildsystem.git')
md5sums=('SKIP')

pkgver() {
	cd buildsystem
	git describe --long | sed 's:release/::; s:-\([0-9]\+\)-:.r\1.:'
}

package() {
	cd buildsystem
	make PREFIX=/usr DESTDIR="$pkgdir" install
	install -Dm644 COPYING \
		"$pkgdir/usr/share/licenses/netsurf/buildsystem"
}

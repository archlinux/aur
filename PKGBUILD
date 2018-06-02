# Maintainer: Mark Wagie <yochanan.marqos@gmail.com>
pkgname=aptik
pkgver=18.5.2
pkgrel=2
pkgdesc="Command-line tool for migrating system settings and data for distributions based on Debian, Arch and Fedora."
arch=('i686' 'x86_64')
url="https://github.com/teejee2008/aptik"
license=('GPL3')
depends=('glib2' 'libgee' 'pv')
makedepends=('git' 'vala')
provides=(aptik)
source=("${pkgname}_v${pkgver}.tgz::https://github.com/teejee2008/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('f354e073a1bd62a886ea54d874007ae651fd2d13a2d32a1b96513ac12a5b43f3')

build() {
	cd "${pkgname}-${pkgver}"
	make all
}

package() {
	cd "${pkgname}-${pkgver}"
	make DESTDIR="$pkgdir/" install
}

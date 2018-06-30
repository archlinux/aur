# Maintainer: Mark Wagie <yochanan.marqos@gmail.com>
pkgname=aptik
pkgver=18.6
pkgrel=1
pkgdesc="Command-line tool for migrating system settings and data for distributions based on Debian, Arch and Fedora."
arch=('i686' 'x86_64')
url="https://github.com/teejee2008/aptik"
license=('GPL3')
depends=('glib2' 'libgee' 'pv')
makedepends=('git' 'vala')
provides=(aptik)
source=("${pkgname}_v${pkgver}.tgz::https://github.com/teejee2008/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('0abafdcffee35e933c8c106b0b48dcdfa234f417950fc23a8ca5755ccb3bb55e')

build() {
	cd "${pkgname}-${pkgver}"
	make all
}

package() {
	cd "${pkgname}-${pkgver}"
	make DESTDIR="$pkgdir/" install
}

# Maintainer: fward <howard Dot main At outlook Dot com>
pkgname=kangaroo-bin
_pkgname=kangaroo
pkgver=0.99.3.200921
pkgrel=1
pkgdesc="Kangaroo is a SQL client and admin tool for popular databases"
arch=('x86_64')
url="https://dbkangaroo.github.io/"
license=('custom')
depends=('glib2' 'gtk3' 'gdk-pixbuf2' 'libgee' 'json-glib' 
	'libsoup' 'libgda' 'gtksourceview4' 'webkit2gtk' 'libssh2' 'openssl')
makedepends=('curl')
optdepends=('libgda-mysql: MySQL support' 'libgda-postgres: PostgreSQL support')
provides=('kangaroo')
conflicts=('kangaroo')

DLAGENTS=("https::/usr/bin/curl -A 'Mozilla' -fLC - --retry 3 --retry-delay 3 -o %o %u")

source=(
    "https://github.com/dbkangaroo/kangaroo/releases/download/v${pkgver}/${_pkgname}-${pkgver}-arch.tar.gz"
)
sha256sums=(
	"87717e82be4f08540f68e79a25738229073e600a139765ef022325241421e0ef"
)

prepare() {
	tar -zxf "${_pkgname}-${pkgver}-arch.tar.gz"
}

package() {
	mkdir "${pkgdir}/usr" -p
	cp -rp "${srcdir}/kangaroo/." "${pkgdir}/usr"
	rm "${pkgdir}/usr/share/applications/mimeinfo.cache"
}

# Maintainer: fward <howard Dot main At outlook Dot com>
pkgname=kangaroo-bin
_pkgname=kangaroo
pkgver=0.29.1.200713
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
	"67fb12beafd4b88b0f5eb7a45e0fd9d7512bd99b0e4206f1710cb5a018aa2058"
)

prepare() {
	tar -zxf "${_pkgname}-${pkgver}-arch.tar.gz"
}

package() {
	mkdir "${pkgdir}/usr" -p
	cp -rp "${srcdir}/kangaroo/." "${pkgdir}/usr"
	rm "${pkgdir}/usr/share/applications/mimeinfo.cache"
}

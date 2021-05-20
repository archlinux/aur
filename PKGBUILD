# Maintainer: fward <howard Dot main At outlook Dot com>
pkgname=kangaroo-bin
_pkgname=kangaroo
pkgver=1.8.1.210430
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
	"7340222fdd5cc61f7c697b10b6b296458ad3bb4797e048f934cc43fcd6d234c7"
)

prepare() {
	tar -zxf "${_pkgname}-${pkgver}-arch.tar.gz"
}

package() {
	cp -rp "${srcdir}/kangaroo/." "${pkgdir}/."
    rm "${pkgdir}/.BUILDINFO"
    rm "${pkgdir}/.PKGINFO"
    rm "${pkgdir}/.MTREE"
    rm "${pkgdir}/usr/lib/libhandy-1.so"
    rm "${pkgdir}/usr/lib/libhandy-1.so.0"
}

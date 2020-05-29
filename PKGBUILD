# Maintainer: fward <howard Dot main At outlook Dot com>
pkgname=kangaroo-bin
_pkgname=kangaroo
pkgver=0.24.1.200525
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
source=(
    "https://github.com/dbkangaroo/kangaroo/releases/download/v${pkgver}/${_pkgname}_${pkgver}_arch.tar.gz"
)
sha256sums=(
	"d23ca034fb6dd31490577d63ec4f140bd41c9a791cfc2c0b3bef21f6f505bbed"
)

prepare() {
	tar -zxf "${_pkgname}_${pkgver}_arch.tar.gz"
}

package() {
	mkdir "${pkgdir}/usr/bin" -p
	mkdir "${pkgdir}/usr/share/pixmaps" -p
	mkdir "${pkgdir}/usr/share/licenses" -p
	mkdir "${pkgdir}/usr/share/applications" -p
	install -Dm755 "${srcdir}/kangaroo/kangaroo" "${pkgdir}/usr/bin/kangaroo"
	install -Dm644 "${srcdir}/kangaroo/LICENSE" "${pkgdir}/usr/share/licenses/kangaroo/LICENSE"
	install -Dm644 "${srcdir}/kangaroo/kangaroo.svg" "${pkgdir}/usr/share/pixmaps/kangaroo.svg"
	install -Dm644 "${srcdir}/kangaroo/kangaroo.desktop" "${pkgdir}/usr/share/applications/kangaroo.desktop"
}

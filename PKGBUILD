# Maintainer: Borislav Borisov <borislav.borisov@gmail.com>
# Contributor: 3ED_0 <krzysztof1987 at gmail>

pkgname=valentina-studio
pkgver=6.5.8
pkgrel=1
pkgdesc="MySQL, MariaDB, PostgreSQL, MS SQL Server, Valentina DB and SQLite GUI Admin Tool"
arch=('i686' 'x86_64')
url="http://www.valentina-db.com"
license=('custom')
makedepends=('rpmextract')
source_i686=("${pkgname}-${pkgver}-${CARCH}.rpm::http://www.valentina-db.com/en/studio/download/current/vstudio_lin_32_rpm?format=raw")
source_x86_64=("${pkgname}-${pkgver}-${CARCH}.rpm::http://www.valentina-db.com/en/studio/download/current/vstudio_x64_lin-rpm?format=raw")
noextract=("${pkgname}-${pkgver}-${CARCH}.rpm")
sha256sums_i686=('dfe89efdfbc3a81e0df71476dc26704fc61753a0e7473946e06b6446b5a19072')
sha256sums_x86_64=('0b0eee63c2689fc92741967573bc0523401d38d7c6d44c5861eb598f42495d76')

prepare() {
	rpmextract.sh "${pkgname}-${pkgver}-${CARCH}.rpm"
}

package() {
	install -d "${pkgdir}"/opt/VStudio
	install -d "${pkgdir}"/usr/share/applications
	install -d "${pkgdir}"/usr/share/doc/vstudio
	cp --preserve=mode -r "${srcdir}"/opt/VStudio/* "${pkgdir}"/opt/VStudio
	cp --preserve=mode -r "${srcdir}"/usr/share/applications/* "${pkgdir}"/usr/share/applications
	cp --preserve=mode -r "${srcdir}"/usr/share/doc/vstudio/* "${pkgdir}"/usr/share/doc/vstudio
}

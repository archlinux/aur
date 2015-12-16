# Maintainer: Borislav Borisov <borislav.borisov@gmail.com>
pkgname=valentina-studio
pkgver=6.2.1
pkgrel=1
pkgdesc="MySQL, MariaDB, PostgreSQL, MS SQL Server, Valentina DB and SQLite GUI Admin Tool"
arch=('i686' 'x86_64')
url="http://www.valentina-db.com"
license=('custom')
makedepends=('rpmextract')
source_i686=("http://www.valentina-db.com/en/studio/download/current/vstudio_lin_32_rpm?format=raw")
source_x86_64=("http://www.valentina-db.com/en/studio/download/current/vstudio_x64_lin-rpm?format=raw")
sha256sums_i686=('0df0d10b06fef39ab08a5ca11ace6e2b8dfd92b83c8cd6ef997d6b8ebe70ad8f')
sha256sums_x86_64=('dce185918a8108e63c87a796ce3c886a5ff2b54effd4fee59c21285428a02baa')

build() {
	if test "$CARCH" == x86_64; then
		rpmextract.sh ../vstudio_x64_lin-rpm?format=raw
	else
		rpmextract.sh ../vstudio_lin_32_rpm?format=raw
	fi
}

package() {
	install -d "${pkgdir}"/opt/VStudio
	install -d "${pkgdir}"/usr/share/applications
	install -d "${pkgdir}"/usr/share/doc/vstudio
	cp --preserve=mode -r "${srcdir}"/opt/VStudio/* "${pkgdir}"/opt/VStudio
	cp --preserve=mode -r "${srcdir}"/usr/share/applications/* "${pkgdir}"/usr/share/applications
	cp --preserve=mode -r "${srcdir}"/usr/share/doc/vstudio/* "${pkgdir}"/usr/share/doc/vstudio
}

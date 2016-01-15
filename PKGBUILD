# Maintainer: Borislav Borisov <borislav.borisov@gmail.com>
pkgname=valentina-studio
pkgver=6.2.5
pkgrel=1
pkgdesc="MySQL, MariaDB, PostgreSQL, MS SQL Server, Valentina DB and SQLite GUI Admin Tool"
arch=('i686' 'x86_64')
url="http://www.valentina-db.com"
license=('custom')
makedepends=('rpmextract')
source_i686=("http://www.valentina-db.com/en/studio/download/current/vstudio_lin_32_rpm?format=raw")
source_x86_64=("http://www.valentina-db.com/en/studio/download/current/vstudio_x64_lin-rpm?format=raw")
sha256sums_i686=('14ec50733b247a38e7a1838bfc3008dd10461c669fd7feb0d68206a57b8245f1')
sha256sums_x86_64=('2f9691475c01ed0563b8aff403bb201f2e445bce646453f000b4c409b0550fff')

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

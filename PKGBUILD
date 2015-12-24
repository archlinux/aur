# Maintainer: Borislav Borisov <borislav.borisov@gmail.com>
pkgname=valentina-studio
pkgver=6.2.3
pkgrel=1
pkgdesc="MySQL, MariaDB, PostgreSQL, MS SQL Server, Valentina DB and SQLite GUI Admin Tool"
arch=('i686' 'x86_64')
url="http://www.valentina-db.com"
license=('custom')
makedepends=('rpmextract')
source_i686=("http://www.valentina-db.com/en/studio/download/current/vstudio_lin_32_rpm?format=raw")
source_x86_64=("http://www.valentina-db.com/en/studio/download/current/vstudio_x64_lin-rpm?format=raw")
sha256sums_i686=('f9f35cc41c5ac5bf4e6a85d2959fd57d02c04a73e4b606be7e672641920158e7')
sha256sums_x86_64=('54fee193f24e6e90bc56f0c4370bf40534a610c5f4883250bf7d9333d5abbff5')

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

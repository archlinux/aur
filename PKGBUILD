# Maintainer: Borislav Borisov <borislav.borisov@gmail.com>
pkgname=valentina-studio
pkgver=6.0.11
pkgrel=1
pkgdesc="MySQL, MariaDB, PostgreSQL, MS SQL Server, Valentina DB and SQLite GUI Admin Tool"
arch=('i686' 'x86_64')
url="https://www.valentina-db.com"
license=('custom')
makedepends=('rpmextract')
source_i686=("http://www.valentina-db.com/en/studio/download/current/vstudio_lin_32_rpm")
source_x86_64=("http://www.valentina-db.com/en/studio/download/current/vstudio_x64_5_lin-rpm")
sha256sums_i686=('daef034d07f052b9d1991a4ee463b11bdbddbc1eff70fd457bf0904403de5966')
sha256sums_x86_64=('3e5ff3a2a2be1ae2c9182b7ea424c46bffada2fbeb4995bef121565821cce51a')

build() {
	if test "$CARCH" == x86_64; then
		rpmextract.sh ../vstudio_x64_5_lin-rpm
	else
		rpmextract.sh ../vstudio_lin_32_rpm
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

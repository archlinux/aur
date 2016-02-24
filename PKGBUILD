# Maintainer: Borislav Borisov <borislav.borisov@gmail.com>
pkgname=valentina-studio
pkgver=6.3.3
pkgrel=1
pkgdesc="MySQL, MariaDB, PostgreSQL, MS SQL Server, Valentina DB and SQLite GUI Admin Tool"
arch=('i686' 'x86_64')
url="http://www.valentina-db.com"
license=('custom')
makedepends=('rpmextract')
source_i686=("http://www.valentina-db.com/en/studio/download/current/vstudio_lin_32_rpm?format=raw")
source_x86_64=("http://www.valentina-db.com/en/studio/download/current/vstudio_x64_lin-rpm?format=raw")
sha256sums_i686=('2b8dcf977e27c29dc2b25a4e87e8aeb39c708061686c0c5dd974f41b379e7155')
sha256sums_x86_64=('206274fecd3e412caacc47ab49ff04be70f32ff158d9c9d24a808a04fcc84920')

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

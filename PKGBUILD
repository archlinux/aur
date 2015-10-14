# Maintainer: Borislav Borisov <borislav.borisov@gmail.com>
pkgname=valentina-studio
pkgver=6.0.9
pkgrel=1
pkgdesc="MySQL, MariaDB, PostgreSQL, MS SQL Server, Valentina DB and SQLite GUI Admin Tool"
arch=('i686' 'x86_64')
url="https://www.valentina-db.com"
license=('custom')
makedepends=('rpmextract')
source_i686=("http://www.valentina-db.com/en/studio/download/current/vstudio_lin_32_rpm")
source_x86_64=("http://www.valentina-db.com/en/studio/download/current/vstudio_x64_5_lin-rpm")
sha256sums_i686=('99aa771a7a836fdd5a014f8ef52fbab0a458c505fdb2326a4314e5b01f50769b')
sha256sums_x86_64=('658fd74f09798564cf8523b5d9aed444a6c600f4db7eb9879b686f469c709257')

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

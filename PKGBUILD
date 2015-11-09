# Maintainer: Borislav Borisov <borislav.borisov@gmail.com>
pkgname=valentina-studio
pkgver=6.1
pkgrel=1
pkgdesc="MySQL, MariaDB, PostgreSQL, MS SQL Server, Valentina DB and SQLite GUI Admin Tool"
arch=('i686' 'x86_64')
url="http://www.valentina-db.com"
license=('custom')
makedepends=('rpmextract')
source_i686=("http://www.valentina-db.com/en/studio/download/current/vstudio_lin_32_rpm")
source_x86_64=("http://www.valentina-db.com/en/studio/download/current/vstudio_x64_lin-rpm")
sha256sums_i686=('df0406b55674db4a2bf436784424aacb87dbcd61c05e1106fb6050c605e81336')
sha256sums_x86_64=('6ea24478e985a203d2d375df8547aa7a8a1c80e2a4e9654d37dc520045ff75f0')

build() {
	if test "$CARCH" == x86_64; then
		rpmextract.sh ../vstudio_x64_6_lin.rpm
	else
		rpmextract.sh ../vstudio_6_lin.rpm
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

# Maintainer: Borislav Borisov <borislav.borisov@gmail.com>
# Contributor: 3ED_0 <krzysztof1987 at gmail>

pkgname=valentina-studio
pkgver=6.5.7
pkgrel=2
pkgdesc="MySQL, MariaDB, PostgreSQL, MS SQL Server, Valentina DB and SQLite GUI Admin Tool"
arch=('i686' 'x86_64')
url="http://www.valentina-db.com"
license=('custom')
makedepends=('rpmextract')
source_i686=("${pkgname}-${pkgver}-${CARCH}.rpm::http://www.valentina-db.com/en/studio/download/current/vstudio_lin_32_rpm?format=raw")
source_x86_64=("${pkgname}-${pkgver}-${CARCH}.rpm::http://www.valentina-db.com/en/studio/download/current/vstudio_x64_lin-rpm?format=raw")
noextract=("${pkgname}-${pkgver}-${CARCH}.rpm")
sha256sums_i686=('0ae496e510b807f0f9bf782fe54be7076477a4721e568fa424dab0fab6bb94bf')
sha256sums_x86_64=('cba508b8cc435447df0a89d39f2d001efb3cb31be1a9d0c678c89a3395819982')

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

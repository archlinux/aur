# Maintainer: SoftExpert <softexpert at gmail dot com>

pkgname=valentina-studio-bin
pkgver=15.3.2
_majorver=15
pkgrel=1
pkgdesc="Create, administer, query and explore Valentina DB, MySQL, MariaDB, PostgreSQL and SQLite databases for FREE."
arch=('x86_64')
url="http://www.valentina-db.com"
license=('custom')
#makedepends=('')
source_x86_64=("${pkgname}-${pkgver}-${CARCH}.deb::http://valentina-db.com/download/release/lin_64/vstudio_x64_${_majorver}_lin.deb")
sha256sums_x86_64=('ee8509f770665bdeedcb9aa2a7e73bb8112871d1602137a6efb4552594fe3076')

prepare() {
	bsdtar -xf "${srcdir}/data.tar.xz" -C "${srcdir}/"
}

package() {
	install -d "${pkgdir}"/opt/VStudio
	install -d "${pkgdir}"/usr/share/applications
	cp --preserve=mode -r "${srcdir}"/opt/VStudio/* "${pkgdir}"/opt/VStudio
	cp --preserve=mode -r "${srcdir}"/usr/share/applications/* "${pkgdir}"/usr/share/applications
}

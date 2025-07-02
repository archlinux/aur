# Maintainer: SoftExpert <softexpert at gmail dot com>

pkgname=valentina-studio-bin
pkgver=15.4
_majorver=15
pkgrel=1
pkgdesc="Create, administer, query and explore Valentina DB, MySQL, MariaDB, PostgreSQL and SQLite databases for FREE."
arch=('x86_64')
url="http://www.valentina-db.com"
license=('custom')
#makedepends=('')
source_x86_64=("${pkgname}-${pkgver}-${CARCH}.deb::http://valentina-db.com/download/release/lin_64/vstudio_x64_${_majorver}_lin.deb")
sha256sums_x86_64=('f03aec9bdb1637bd4c146ce9a1aa2e197da35069f1f5be0fb3929f7d4aeb9291')

prepare() {
	bsdtar -xf "${srcdir}/data.tar.xz" -C "${srcdir}/"
}

package() {
	install -d "${pkgdir}"/opt/VStudio
	install -d "${pkgdir}"/usr/share/applications
	cp --preserve=mode -r "${srcdir}"/opt/VStudio/* "${pkgdir}"/opt/VStudio
	cp --preserve=mode -r "${srcdir}"/usr/share/applications/* "${pkgdir}"/usr/share/applications
}

# Maintainer: SoftExpert <softexpert at gmail dot com>

pkgname=valentina-studio-bin
pkgver=14.5.2
_majorver=14
pkgrel=1
pkgdesc="Create, administer, query and explore Valentina DB, MySQL, MariaDB, PostgreSQL and SQLite databases for FREE."
arch=('x86_64')
url="http://www.valentina-db.com"
license=('custom')
#makedepends=('')
source_x86_64=("${pkgname}-${pkgver}-${CARCH}.deb::http://valentina-db.com/download/release/lin_64/vstudio_x64_${_majorver}_lin.deb")
sha256sums_x86_64=('81011a1917f7bebdd44487eedc656920ede5293685535a0c4294d578135a2d79')

prepare() {
	bsdtar -xf "${srcdir}/data.tar.xz" -C "${srcdir}/"
}

package() {
	install -d "${pkgdir}"/opt/VStudio
	install -d "${pkgdir}"/usr/share/applications
	cp --preserve=mode -r "${srcdir}"/opt/VStudio/* "${pkgdir}"/opt/VStudio
	cp --preserve=mode -r "${srcdir}"/usr/share/applications/* "${pkgdir}"/usr/share/applications
}

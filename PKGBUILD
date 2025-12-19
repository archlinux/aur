# Maintainer: SoftExpert <softexpert at gmail dot com>

pkgname=valentina-studio-bin
pkgver=16.5.0
_majorver=16
pkgrel=1
pkgdesc="Create, administer, query and explore Valentina DB, MySQL, MariaDB, PostgreSQL and SQLite databases for FREE."
arch=('x86_64')
url="http://www.valentina-db.com"
license=('custom')
#makedepends=('')
source_x86_64=("${pkgname}-${pkgver}-${CARCH}.deb::https://www.valentina-db.com/en/all-downloads/vstudio/current/vstudio_x64_lin_deb?format=raw")
sha256sums_x86_64=('a1bcd3b3f247d40878535a8f81782b2882df36a633dfd8d1bd2531c6a8cefb35')

prepare() {
	bsdtar -xf "${srcdir}/data.tar.xz" -C "${srcdir}/"
}

package() {
	install -d "${pkgdir}"/opt/VStudio
	install -d "${pkgdir}"/usr/share/applications
	cp --preserve=mode -r "${srcdir}"/opt/VStudio/* "${pkgdir}"/opt/VStudio
	cp --preserve=mode -r "${srcdir}"/usr/share/applications/* "${pkgdir}"/usr/share/applications
}

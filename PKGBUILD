# Maintainer: ROllerozxa <temporaryemail4meh [gee mail]>
pkgname=minetest-castrum
_pkgname=castrum
_pkgauthor=1248
pkgver=1.11.2
_cdbrel=4788
pkgrel=1
pkgdesc="You are on a floor plan of a castle. Collect resources and rebuild the old castle."
license=("LGPLv2.1")
sha256sums=('ffa126c795e3c3023a920461047557fc64d76b3f531ac48440db5be4ea1756b3')

arch=("any")
url="https://content.minetest.net/packages/${_pkgauthor}/${_pkgname}/"
depends=("minetest-common")
makedepends=("unzip")
source=("${_pkgname}-${pkgver}.zip::https://content.minetest.net/packages/${_pkgauthor}/${_pkgname}/releases/${_cdbrel}/download/")
options=(!strip)
noextract=("${_pkgname}-${pkgver}.zip")

package() {
	# the release zip has the files in the root of the archive
	install -d "${pkgdir}/usr/share/minetest/games/${_pkgname}"
	unzip "${_pkgname}-${pkgver}.zip" -d "${pkgdir}/usr/share/minetest/games/${_pkgname}/"
}

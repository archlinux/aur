# Maintainer: ROllerozxa <temporaryemail4meh [gee mail]>
pkgname=minetest-lordofthetest
_pkgname=lordofthetest
_pkgauthor=Amaz
pkgver=1.2.6
_cdbrel=12831
pkgrel=1
pkgdesc="Lord of the Test is a game which adds LOTR elements to Minetest "
license=("LGPLv2.1")
sha256sums=('4b79aef550d2081ac38df9eb9376bdb17a2d916763f5f85e205cfa57ea342afe')

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

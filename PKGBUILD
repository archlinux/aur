# Maintainer : Eragon <eragon at eragon dot re>

pkgname=manyverse-bin
_pkgname=manyverse
pkgdesc="A social network off the grid"
pkgrel=0
pkgver=0.2307.3
_pkgver=$pkgver-beta
arch=('x86_64')
url="https://manyver.se"
license=('MPL2')
source=(
	"https://github.com/staltz/manyverse/releases/download/v${_pkgver}/${_pkgname}-${_pkgver}.tar.gz"
	'manyverse.png::https://gitlab.com/staltz/manyverse-site/-/raw/master/src/images/logo-square.png'
	'manyverse.desktop'
	'manyverse.sh')
sha256sums=(
	'562053dc51d2583c595effd6635591c77444e24087ffc772e2e4d3475a442bb3'
	'8fe2216da0a258fc9eb3bd2488a6b09ccc4c8cd753b74cba85e827d5c792998e'
	'60fbacb296707f47c57659c78d15c68a82c5363d9c629d12f210a303a13b6379'
	'3da5580a758dd55df3cbb4329662face1fdc594bd72618b962387dba7e9b93ce')

package() {
	mkdir -p "${pkgdir}/opt/"
	cp -r "${_pkgname}-${_pkgver}/" "${pkgdir}/opt/Manyverse"
	install -D -m755 "manyverse.desktop" "${pkgdir}/usr/share/applications/manyverse.desktop"
	install -D -m755 "manyverse.sh" "${pkgdir}/usr/bin/manyverse"
	install -D -m644 "manyverse.png" "${pkgdir}/usr/share/icons/hicolor/1024x1024/apps/manyverse.png"
}


pkgname=manyverse-bin
pkgdesc="A social network off the grid"
pkgrel=2
pkgver=0.2201.7
arch=('x86_64')
url="https://manyver.se"
license=('MPL2')
source=(
	"https://github.com/staltz/manyverse/releases/download/v${pkgver}-beta/manyverse-${pkgver}-beta.tar.gz"
	'manyverse.png::https://gitlab.com/staltz/manyverse-site/-/raw/master/src/images/logo-square.png'
	'manyverse.desktop'
	'manyverse.sh')
sha256sums=(
	'c960d8a15fdbe70f979ac6fd756a1ef6d3c781a443122455b5df3ce25ccd8c81'
	'8fe2216da0a258fc9eb3bd2488a6b09ccc4c8cd753b74cba85e827d5c792998e'
	'60fbacb296707f47c57659c78d15c68a82c5363d9c629d12f210a303a13b6379'
	'3da5580a758dd55df3cbb4329662face1fdc594bd72618b962387dba7e9b93ce')

package() {
	mkdir -p "${pkgdir}/opt/"
	cp -r "manyverse-${pkgver}-beta/" "${pkgdir}/opt/Manyverse"
	install -D -m755 "manyverse.desktop" "${pkgdir}/usr/share/applications/manyverse.desktop"
	install -D -m755 "manyverse.sh" "${pkgdir}/usr/bin/manyverse"
	install -D -m644 "manyverse.png" "${pkgdir}/usr/share/icons/hicolor/1024x1024/apps/manyverse.png"
}

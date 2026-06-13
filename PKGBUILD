# Contributer: Mikhail Babynichev <i@kotrik.ru>
# Maintainer: Mikhail Babynichev <i@kotrik.ru>

pkgname=tosu
pkgver=4.22.2
pkgrel=1
pkgdesc="Eponymous software for reading osu! memory"
arch=(x86_64)
url="https://github.com/tosuapp/tosu"
license=("LGPL3")
depends=()
makedepends=()
checkdepends=()
optdepends=(tosu-overlay)
provides=(tosu)
conflicts=(tosu)
replaces=()
backup=()
options=(!strip)
install=
changelog=
source=("https://github.com/tosuapp/${pkgname}/releases/download/v${pkgver}/${pkgname}-linux-v${pkgver}.zip"
	"tosu-bin.sh"        
)
sha256sums=("cd88d1af4e5885ab9f7dc9da5cb338cb0fc7b7e0435c84a4b03b1018467545d8"
	"ada3abbdb7bd09dea02e8149a63dc3a730bd300186ac3a136d624acaaa9d225f"
)
validpgpkeys=()

package() {
	# Install tosu binary
	install -Dm777 "${srcdir}/${pkgname}" "${pkgdir}/opt/tosu/tosu"	
	
	# Allow user and executable to write new files
	chmod 777 "${pkgdir}/opt/tosu"

	# Launcher
	install -Dm755 "${srcdir}/tosu-bin.sh" "${pkgdir}/usr/bin/tosu"
}

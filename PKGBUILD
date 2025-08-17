# Contributer: Mikhail Babynichev <i@kotrik.ru>
# Maintainer: Mikhail Babynichev <i@kotrik.ru>

pkgname=tosu
pkgver=4.12.1
pkgrel=1
pkgdesc="Eponymous software for reading osu! memory"
arch=(x86_64)
url="https://github.com/tosuapp/tosu"
license=("LGPL3")
depends=()
makedepends=()
checkdepends=()
optdepends=()
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
sha256sums=("9c66c695339a6a8c1bda724845975c03f6dfcc1bcbdfac3264ed0b7a2d755a87"
	"16e77f6a192094be77ce1ecc9322e7296b57532851672d15f07bc82132cdfc21"
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

# Contributer: Mikhail Babynichev <i@kotrik.ru>
# Maintainer: Mikhail Babynichev <i@kotrik.ru>

pkgname=tosu
pkgver=4.2.0
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
sha256sums=("a70daba4fc686d71fc3bc6a769e56bc4b9b85021a8c0b76a0024cf57b018e475"
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

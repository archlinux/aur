# Maintainer: Corentin Cadiou <contact@cphyc.me>
pkgname=focalboard-bin
pkgver=v7.10.4
pkgrel=1
epoch=
pkgdesc="A self-hosted alternative to Trello, Notion, and Asana."
arch=(x86_64)
url="https://github.com/mattermost/focalboard"
license=('MIT')
groups=()
depends=(webkit2gtk)
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=(
	"${pkgname}-${pkgver}.tar.gz::https://github.com/mattermost/focalboard/releases/download/${pkgver}/focalboard-linux.tar.gz"
	"focalboard.desktop"
	"focalboard_launcher.sh"
)
noextract=()
sha256sums=('4144172350601de1020cef652da6ca890d34cd3767340315cf3a1f7e2aac77ad'
            'beaa7a13fa7f8df7b7d65a35e5c56432fbf543cd7cd85dd8e83ad55cf6865fc9'
            '2a76b99b190bdaf347eef3c4b92e63a2164204455094653a9231a535881cd18b')
validpgpkeys=()

package() {
	cd focalboard-app
	mkdir -p "${pkgdir}/opt/${pkgname}" "${pkgdir}/usr/bin" "${pkgdir}/usr/share/applications"

	# Copy data in /usr/share
	cp -r focalboard-app pack config.json "${pkgdir}/opt/${pkgname}/"
	install "${srcdir}/focalboard.desktop" "${pkgdir}/usr/share/applications/"

	# Create launcher in /usr/bin
	install "${srcdir}/focalboard_launcher.sh" "${pkgdir}/usr/bin/${pkgname}"
}

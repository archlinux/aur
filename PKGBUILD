# Maintainer: Sematre <sematre at gmx dot de>
pkgname=gamehub-bin
_pkgver=0.16.3-2
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Games manager, downloader, library that supports GOG, Steam and Humble Bundle"
arch=("x86_64")
url="https://tkashkin.github.io/projects/gamehub/"
license=(GPL3)
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
depends=("gtk3" "glib2" "libgee" "libsoup" "json-glib" "sqlite" "webkit2gtk" "libmanette" "libxtst")
optdepends=(
	"steam: Support for Steam"
	"itch: Support for itch.io"
	"innoextract: Extract GOG installer without wine"
	"wine: Compatibility layer for running Windows games"
	"dosbox: Emulator for running DOS Games"
)
source=("GameHub-${pkgver}_amd64.deb::https://github.com/tkashkin/GameHub/releases/download/${_pkgver}-master/GameHub-${_pkgver}-master-bionic-amd64.deb")
sha256sums=('7ec3aa1b21014329f453144ee7cf66089ed698543d63dfa74b96ba3b606f9819')

package() {
	tar xvf "${srcdir}/data.tar.xz" -C "${pkgdir}"
}

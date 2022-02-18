# Maintainer: Sematre <sematre at gmx dot de>
pkgname=gamehub-bin
_pkgver=0.16.2-1
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
source=("GameHub-${pkgver}_amd64.deb::https://github.com/tkashkin/GameHub/releases/download/${_pkgver}-dev/GameHub-${_pkgver}-dev-bionic-amd64.deb")
sha256sums=('234ae571c885f81652951aa21074cfb3fb907e5ffe9b27184a5e16ddc50fac25')

package() {
	tar xvf "${srcdir}/data.tar.xz" -C "${pkgdir}"
}

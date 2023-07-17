_pkgname="duelyst"
pkgname="open-duelyst-bin"
pkgver=1.97.13
pkgrel=1
pkgdesc="Duelyst is a digital collectible card game and turn-based strategy hybrid, developed by Counterplay Games"
arch=("x86_64")
url='https://github.com/open-duelyst/duelyst'
license=('CC01.0')
makedepends=()
depends=('gconf')
noextract=("duelyst-desktop-v${pkgver}-linux-x64.zip")
source=("https://github.com/open-duelyst/duelyst/releases/download/${pkgver}/duelyst-desktop-v${pkgver}-linux-x64.zip"
	"duelyst.desktop")
sha256sums=('a0f44d8f92354de449e60759592c6495daf1e64b198b1f88b1fbf316c356de48'
            '09f05f3a7f8fba4e7e5f7a070fba1f9005b25661bef86de891cbecd94ab2dde4')


package() {
	install -dm755 "${pkgdir}/opt/${_pkname}"
	install -dm755 "${pkgdir}/usr/local/bin"
	install -dm755 "${pkgdir}/usr/share/applications"

	unzip duelyst-desktop-v${pkgver}-linux-x64.zip -d "${pkgdir}/opt/${_pkgname}"

	ln -s /opt/${pkgdir}/Duelyst "${pkgdir}/usr/local/bin/${_pkgname}"

	# install desktop entry
  	install -D -m644 ${_pkgname}.desktop $pkgdir/usr/share/applications/${_pkgname}.desktop
}

# Maintainer:  vcalv

pkgname=pinnacle
pkgver=1.0
pkgrel=1
pkgdesc='Modern tribute to the 1986 classic "The Sentinel"'
arch=('x86_64')
url='https://viperfish.com.au/games/pinnacle.html'
license=('custom')
depends=()
provides=('pinnacle')
options=('!strip' '!emptydirs')
source=(
    "${pkgname}-${pkgver}.zip::https://viperfish.com.au/downloads.html?download=1:pinnacle-linux"
)
sha512sums=('4a379944df2a816d751c16cfd7bf385499a344464b2ccebec10e414c364b0ef7ac83375c9e3c71c2b7fffdfc27e26ba1a77623135b7ffb4f366e60034638d269')

_installdir='/opt/pinnacle'

package() {
	_exec="Pinnacle.x86_64"

    install -d "${pkgdir}/usr/bin/"

    install -Dt "${pkgdir}/${_installdir}/" "${_exec}"
	ln -s "${_installdir}/${_exec}" "${pkgdir}/usr/bin/${pkgname}"
}

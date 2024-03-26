# Maintainer:  vcalv

pkgname=pinnacle
pkgver=1.0
pkgrel=2
pkgdesc='Modern tribute to the 1986 classic "The Sentinel"'
arch=('x86_64')
url='https://viperfish.com.au/games/pinnacle.html'
license=('custom')
depends=()
provides=('pinnacle')
options=('!strip' '!emptydirs')
source=(
    "${pkgname}-${pkgver}.zip::https://viperfish.com.au/downloads.html?download=1:pinnacle-linux"
	pinnacle.png
	pinnacle.desktop
)
sha512sums=(
	'4a379944df2a816d751c16cfd7bf385499a344464b2ccebec10e414c364b0ef7ac83375c9e3c71c2b7fffdfc27e26ba1a77623135b7ffb4f366e60034638d269'
	'5bf4afc12e1a3a721393acc2a96d7a6006dbafbd6a26e0f75db70cb2a7cf374940f035018a503186592ca54070a5de35820122e8d9e05d3d7ea68b07a297f1e1'
	'9d9c63751543a183e07b17c37629ccf63f31ef7f98e953f52894fab17a2db272d97fc0186542eaed11d7d9c54d24d52536dc027a02d57633a002b2a0ab293617'
)

_installdir='/opt/pinnacle'

package() {
	_exec="Pinnacle.x86_64"

    install -d "${pkgdir}/usr/bin/"

    install -Dt "${pkgdir}/${_installdir}/" "${_exec}"
	ln -s "${_installdir}/${_exec}" "${pkgdir}/usr/bin/${pkgname}"

    install -Dt "$pkgdir/usr/share/applications/" "pinnacle.desktop"
    install -Dt "$pkgdir/usr/share/pixmaps/" "pinnacle.png"

}

# Maintainer:  Travis Collins <erbrecht at pobox dot com>

pkgname=noisetorch-bin
pkgver=0.3.4_beta
pkgrel=3
pkgdesc='Easy to use noise suppression for PulseAudio'
arch=('x86_64')
url="https://github.com/lawl/NoiseTorch"
license=('GPL3')
optdepends=('hicolor-icon-theme')
provides=('noisetorch')
options=(!strip)
source=(
	"${pkgname}-${pkgver}.tar.gz::https://github.com/lawl/NoiseTorch/releases/download/${pkgver/_/-}/NoiseTorch_x64.tgz"
)
sha256sums=('2d5c3c4a9e12a078019f003312486aca4111e977bb4eae4769163712b51038f8')

package() {
	mkdir -p "${pkgdir}/usr/bin"
	mkdir -p "${pkgdir}/usr/share/applications"

	install -m755 .local/bin/noisetorch "${pkgdir}/usr/bin/noisetorch"
	install -m644 .local/share/applications/noisetorch.desktop \
		"${pkgdir}/usr/share/applications/noisetorch.desktop"

	if [[ -d "/usr/share/icons/hicolor/256x256/apps/" ]]
	then
		mkdir -p "${pkgdir}/usr/share/icons/hicolor/256x256/apps"
		install -m644 .local/share/icons/hicolor/256x256/apps/noisetorch.png \
			"${pkgdir}/usr/share/icons/hicolor/256x256/apps/noisetorch.png"
	fi
}

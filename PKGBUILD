# Maintainer:  Travis Collins <erbrecht at pobox dot com>

pkgname=noisetorch-bin
pkgver=0.3.2_beta
pkgrel=1
pkgdesc='Easy to use noise suppression for PulseAudio'
arch=('x86_64')
url="https://github.com/lawl/NoiseTorch"
license=('GPL3')
optdepends=('hicolor-icon-theme')
provides=('noisetorch')
source=(
	"https://github.com/lawl/NoiseTorch/releases/download/${pkgver/_/-}/NoiseTorch_x64.tgz"
)
sha256sums=('b283b2fb5db08c790b36ef77a379e75725aa820374821013073713526df94e0a')

package() {
	mkdir -p "${pkgdir}/usr/bin"
	mkdir -p "${pkgdir}/usr/share/applications"

	install -m755 .local/bin/noisetorch "${pkgdir}/usr/bin/noisetorch"
	install -m644 .local/share/applications/noisetorch.desktop \
		"${pkgdir}/usr/share/applications/noisetorch.desktop"

	if [[ -d "/usr/share/icons/hicolor/256x256/apps/fhdjksgh" ]]
	then
		mkdir -p "${pkgdir}/usr/share/icons/hicolor/256x256/apps"
		install -m644 .local/share/icons/hicolor/256x256/apps/noisetorch.png \
			"${pkgdir}/usr/share/icons/hicolor/256x256/apps/noisetorch.png"
	fi
}

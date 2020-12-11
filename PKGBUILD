# Maintainer:  Travis Collins <erbrecht at pobox dot com>

pkgname=noisetorch-bin
pkgver=0.8.2
pkgrel=2
pkgdesc='Easy to use noise suppression for PulseAudio'
arch=('x86_64')
url="https://github.com/lawl/NoiseTorch"
license=('GPL3')
depends=('polkit')
optdepends=()
provides=('noisetorch')
conflicts=('noisetorch-git' 'noisetorch')
options=(!strip)
install="${pkgname}.install"
source=(
	"${pkgname}-${pkgver}.tar.gz::https://github.com/lawl/NoiseTorch/releases/download/${pkgver/_/-}/NoiseTorch_x64.tgz"
	"${pkgname}.install"
)
sha256sums=('e350b59e54980e02bb9a4fcc324c347633c5b973b9c86ce43097db29e3cd640a'
            '84359c186c870220eeb56e9750319bb0c334c1440dd0f974df9e21a4084f80a5')

package() {
	install -D -m755 .local/bin/noisetorch "${pkgdir}/usr/bin/noisetorch"
	install -D -m644 .local/share/applications/noisetorch.desktop \
		"${pkgdir}/usr/share/applications/noisetorch.desktop"

	install -D -m644 .local/share/icons/hicolor/256x256/apps/noisetorch.png \
		"${pkgdir}/usr/share/icons/hicolor/256x256/apps/noisetorch.png"
}

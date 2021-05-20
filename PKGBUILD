# Maintainer:  Travis Collins <erbrecht at pobox dot com>

pkgname=noisetorch-bin
pkgver=0.11.1
pkgrel=1
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
sha256sums=('7d87469307ce509a99e8a3cefb00eaf507f478ffab66ccbc30cd1bf7ce27a4b0'
            '84359c186c870220eeb56e9750319bb0c334c1440dd0f974df9e21a4084f80a5')

package() {
	install -D -m755 .local/bin/noisetorch "${pkgdir}/usr/bin/noisetorch"
	install -D -m644 .local/share/applications/noisetorch.desktop \
		"${pkgdir}/usr/share/applications/noisetorch.desktop"

	install -D -m644 .local/share/icons/hicolor/256x256/apps/noisetorch.png \
		"${pkgdir}/usr/share/icons/hicolor/256x256/apps/noisetorch.png"
}

# Maintainer:  Travis Collins <erbrecht at pobox dot com>

pkgname=noisetorch-bin
pkgver=0.5.1_beta
pkgrel=1
pkgdesc='Easy to use noise suppression for PulseAudio'
arch=('x86_64')
url="https://github.com/lawl/NoiseTorch"
license=('GPL3')
depends=('polkit')
optdepends=('hicolor-icon-theme')
provides=('noisetorch')
conflicts=('noisetorch-git')
options=(!strip)
install="${pkgname}.install"
source=(
	"${pkgname}-${pkgver}.tar.gz::https://github.com/lawl/NoiseTorch/releases/download/${pkgver/_/-}/NoiseTorch_x64.tgz"
	"${pkgname}.install"
)
sha256sums=('516297d9bb017ff7bb280cc11303446784e11218741ec40dc0c60c1058fb6bda'
            '4074b71327284b1ad75aee32bee0462360b90061237e998bf4f7e259a65e3caa')

package() {
	install -D -m755 .local/bin/noisetorch "${pkgdir}/usr/bin/noisetorch"
	install -D -m644 .local/share/applications/noisetorch.desktop \
		"${pkgdir}/usr/share/applications/noisetorch.desktop"

	if [[ -d "/usr/share/icons/hicolor/256x256/apps/" ]]
	then
		install -D -m644 .local/share/icons/hicolor/256x256/apps/noisetorch.png \
			"${pkgdir}/usr/share/icons/hicolor/256x256/apps/noisetorch.png"
	fi
}

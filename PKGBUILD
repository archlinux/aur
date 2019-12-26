# Maintainer: FirstAirBender <noblechuk5 [at] web [dot] de>

pkgname=natpad
pkgver=2.5
pkgrel=1
pkgdesc='Natpad is a Text-editor written in C using GTK'
arch=('x86_64')
url='https://github.com/douwevos/natpad'
license=('GPL3')
provides=(natpad)
source=(
	"natpad-${pkgver}-amd64.deb::https://github.com/douwevos/${pkgname}/releases/download/v${pkgver}/${pkgname}_${pkgver}_amd64.deb"
)
noextract=(
	"natpad-${pkgver}-amd64.deb"
)
sha256sums=(
	'1041f16317e852d3d232790cbfaff553b6b58cd996df77a9db77e928a162308b'
)

package() {
	bsdtar -O -xf "natpad-${pkgver}-amd64.deb" data.tar.xz | bsdtar -C "${pkgdir}" -xJf -

  	# Permission fix
	find "${pkgdir}" -type d -exec chmod 755 {} +
}

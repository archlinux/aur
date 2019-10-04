# Maintainer: Aaron Bishop < erroneous at gmail >

_pkgname=RCMeetings
_pkgver=1210
pkgname=ringcentral-meetings-bin
provides=('ringcentral-meetings')
conflicts=('ringcentral-meetings')
pkgver=7.0.1
pkgrel=1
depends=(
	'glib2'
	'libxcb'
	'fontconfig'
	'mesa'
	'libxi'
	'libsm'
	'libxrender'
	'libpulse'
	'libxcomposite'
	'libxslt'
	'sqlite'
	'libxcb'
	'dbus'
	'libibus'
	'qt5-multimedia'
	'qt5-script'
	'qt5-webengine'
	'qt5-xmlpatterns'
	'qt5-svg'
	)
optdepends=(
	'gtk3: GTK Theme support'
	'qt5-quickcontrols2: Qt Controls plugin support'
	)
pkgdesc="Video Conferencing and Web Conferencing Service"
arch=('x86_64')
license=('custom')
url="https://www.ringcentral.com"
source=(
	"http://dn.ringcentral.com/data/web/download/${_pkgname}/${_pkgver}/${_pkgname}ClientSetup.deb"
	"LICENSE.html::https://www.ringcentral.com/legal/rcmeetings-tos.html"
	)

sha256sums=(
	'd2abe77670263d1def0c98da3b1c949ca9f2b13cf477b0969a08ab843a0e6b88'
	'SKIP'
	)

package() {
	tar -xJC "${pkgdir}" -f data.tar.xz
	mkdir -p "${pkgdir}/usr/share/licenses/$pkgname"
	install -Dm644 LICENSE.html "$pkgdir/usr/share/licenses/$pkgname/LICENSE.html"
}

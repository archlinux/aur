# Maintainer: Aaron Bishop < erroneous at gmail >

_pkgname=RCMeetings
pkgname=ringcentral-meetings-bin
provides=('ringcentral-meetings')
conflicts=('ringcentral-meetings')
pkgver=21.3.52668.0913
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
	'qt5-wayland'
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
	"https://downloads.ringcentral.com/RCM/RC/meetings/linux/RCMeetingsClientSetup.deb"
	"LICENSE.html::https://www.ringcentral.com/legal/rcmeetings-tos.html"
	)

sha256sums=(
	'af6899d4e68fbe8fc45faa454f3be00b0751df1442f2a45904368fc3deaf6753'
	'SKIP'
	)

pkgver() {
	tar -xOf control.tar.xz ./control | grep Version | awk -e '{print $2}'
}

package() {
	tar -xJC "${pkgdir}" -f data.tar.xz
	mkdir -p "${pkgdir}/usr/share/licenses/$pkgname"
	install -Dm644 LICENSE.html "$pkgdir/usr/share/licenses/$pkgname/LICENSE.html"
}

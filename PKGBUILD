# Maintainer: ocus

pkgname=tixeoclient
pkgver=16.5.1.1
pkgrel=1
pkgdesc="Tixeo secure video conferencing client"
arch=('x86_64')
url="https://www.tixeo.com"
license=('custom')
depends=('libxss' 'libsecret' 'libappindicator-gtk3' 'zlib' 'dbus-glib' 'gtk3' 'xdg-utils' 'org.freedesktop.secrets')
makedepends=()
optdepends=('vlc: MediaPlayer')
source=("http://repos.tixeo.com/debian/pool/non-free/t/tixeoclient/${pkgname}_${pkgver}_amd64.deb")
md5sums=('b11b45a277d2dc49507756879d2dff3a')

package() {
	tar -C "${pkgdir}" -xf data.tar.gz

	install -d -m755 "${pkgdir}/usr/bin"
	ln -s "/opt/tixeoclient/tixeoclient" "${pkgdir}/usr/bin/tixeoclient"

	install -d -m755 "${pkgdir}/usr/share/icons/hicolor/scalable/apps/"
	ln -s "/opt/tixeoclient/Res/tixeoclient.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/tixeo-tixeoclient.svg"

	install -d -m755 "${pkgdir}/usr/share/applications/"
	ln -s "/opt/tixeoclient/Res/tixeo-tixeoclient.desktop" "${pkgdir}/usr/share/applications/tixeo-tixeoclient.desktop"
}

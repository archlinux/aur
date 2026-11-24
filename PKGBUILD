# Maintainer: ocus

pkgname=tixeoclient
pkgver=18.2.1
pkgrel=1
pkgdesc="Tixeo secure video conferencing client"
arch=('x86_64')
url="https://www.tixeo.com"
license=('custom')
depends=('libxss' 'libsecret' 'libappindicator-gtk3' 'zlib' 'dbus-glib' 'gtk3' 'xdg-utils' 'org.freedesktop.secrets')
makedepends=()
optdepends=('vlc: MediaPlayer')
source=("https://packages.tixeo.com/tcc/18.2/latest/deb/pool/non-free/t/tixeoclient/${pkgname}_${pkgver}_amd64.deb")
md5sums=('0d38a2a6b58b6f60cd73994b2ce260da')

package() {
	tar -C "${pkgdir}" -xf data.tar.gz

    find $pkgdir -exec chmod go-w {} \;

	install -d -m755 "${pkgdir}/usr/bin"
	ln -s "/opt/tixeoclient/tixeoclient" "${pkgdir}/usr/bin/tixeoclient"

	install -d -m755 "${pkgdir}/usr/share/icons/hicolor/scalable/apps/"
	ln -s "/opt/tixeoclient/Res/tixeoclient.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/tixeo-tixeoclient.svg"

	install -d -m755 "${pkgdir}/usr/share/applications/"
	ln -s "/opt/tixeoclient/Res/tixeo-tixeoclient.desktop" "${pkgdir}/usr/share/applications/tixeo-tixeoclient.desktop"
}

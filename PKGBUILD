# Maintainer: Milo Gilad <myl0gcontact@gmail.com>
_pkgname=todoist
pkgname=todoist-linux-bin
pkgver=0.5.0
pkgrel=3
epoch=
pkgdesc="Unofficial desktop client for Todoist"
arch=(x86_64)
url="http://todoistlinux.hakimouake.com/"
license=('unknown')
depends=('gconf' 'libnotify' 'alsa-lib' 'gtk2' 'libxtst' 'nss')
conflicts=('todoist')
source=("https://github.com/kamhix/todoist-linux/releases/download/v${pkgver%.0}-beta/todoist-${pkgver}-linux-x64.tar.gz"
		"Todoist.desktop")

options=('!strip')

package() {
	# Main Files
	install -d "${pkgdir}/opt/${_pkgname}"
	cp -ra "${srcdir}/." "${pkgdir}/opt/${_pkgname}"

	# Make executable
	chmod -R 755 "${pkgdir}/opt/${_pkgname}"

	# Desktop entry
	install -d "${pkgdir}/usr/share/applications"
	install "${srcdir}/Todoist.desktop" "${pkgdir}/usr/share/applications"

	# Binary link
	install -d "${pkgdir}/usr/bin"
	ln -s "/opt/${_pkgname}/todoist" "${pkgdir}/usr/bin/${_pkgname}"
}
sha512sums=('12a616395a548891201cfbf51162fee2f7385c1588235b5ae11290b2c2f11d9386670234cfa8bca9b8aa82b807479917c06515ec05a64132040f60d5721f2dfe'
            '8c3a96c0582833edd43efdf36b126e25c0c98fe34bc9e1c43c32bde350f69f090b75c89fd795a1decdd9bca9fdd35e776a43aabb04c6306a32d5b43da41fe143')

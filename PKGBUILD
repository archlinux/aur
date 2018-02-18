# Maintainer: Milo Gilad <myl0gcontact@gmail.com>
_pkgname=todoist
pkgname=todoist-linux-bin
pkgver=0.3
pkgrel=2
epoch=
pkgdesc="Unofficial desktop client for Todoist"
arch=(x86_64)
url="http://todoistlinux.hakimouake.com/"
license=('unknown')
depends=('gconf' 'libnotify' 'alsa-lib' 'gtk2' 'libxtst' 'nss')
conflicts=('todoist')
source=("https://s3.amazonaws.com/kamhix/downloads/todoist-linux-64bits.tar.gz"
		"Todoist.desktop")

options=('!strip')

package() {
	# Main Files
	install -d "${pkgdir}/opt/${_pkgname}"
	cp -a "${srcdir}/64/." "${pkgdir}/opt/${_pkgname}"

	# Make executable
	chmod 755 "${pkgdir}/opt/${_pkgname}/Todoist"

	# Desktop entry
	install -d "${pkgdir}/usr/share/applications"
	install "${srcdir}/Todoist.desktop" "${pkgdir}/usr/share/applications"

	# Binary link
	install -d "${pkgdir}/usr/bin"
	ln -s "/opt/${_pkgname}/Todoist" "${pkgdir}/usr/bin/${_pkgname}"
}

md5sums=('c107b9c92f9eab3a33b42afa434e28f0'
         '196a345c7e51d52a7f6fec90c476e305')

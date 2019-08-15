# Maintainer: Milo Gilad <myl0gcontact@gmail.com>
_pkgname=todoist
pkgname=todoist-linux-bin
pkgver=0.5
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

sha512sums=('942d073844a955e5c70fdd57d61b849fb227f50b13529466fd26955fb2a3cab17d08941f57451e0298ee6025b23eebc391f082bafad83c7e3f2f0b53ab1a02f4'
            '8c3a96c0582833edd43efdf36b126e25c0c98fe34bc9e1c43c32bde350f69f090b75c89fd795a1decdd9bca9fdd35e776a43aabb04c6306a32d5b43da41fe143')

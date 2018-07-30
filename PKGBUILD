# Maintainer: Milo Gilad <myl0gcontact@gmail.com>
_pkgname=todoist
pkgname=todoist-linux-bin
pkgver=0.5
pkgrel=1
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
            '57ff03370058564bd185e9b561a33fe6cbd37ea9794aea48bbc39dd62639bb9028f3c1777daf0fc113a176fa75693fbf790295998cd9a213e09c7108a6ec3124')

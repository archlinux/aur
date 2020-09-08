# Maintainer: Radim Sückr <kontakt at radimsuckr dot cz>
# Contributor: Whezzel <whezzel at gmail dot com>
# Contributor: Karel Louwagie <karel at louwagie dot net>
# Contributor: Samuel Walladge <samuel at swalladge dot id dot au>
# Contributor: Yurii Kolesnykov <root at yurikoles dot com>

pkgname=toggldesktop-bin
_pkgname=toggldesktop
pkgver=7.5.260
pkgrel=1
pkgdesc='Toggl time tracking software'
arch=('x86_64')
provides=('toggldesktop')
conflicts=(
	'toggldesktop'
)
url='https://github.com/toggl-open-source/toggldesktop'
source=('toggldesktop.tar.gz::https://github.com/toggl-open-source/toggldesktop/releases/download/v7.5.260/toggldesktop_linux_7.5.260_x86_64.tar.gz')
sha512sums=('81000b70fb886482615971d9ed18c8bb37798d0bedc9cc638d505e0bcc43c13b08540dc89c15824ea582a19b0cb0fcd7243a7bdcb2db6249b97065c8716700cc')

package() {
	# Path taken from TogglDesktop.sh
	_libdst="${pkgdir}/usr/lib/toggldesktop"
	mkdir -p ${_libdst}

	cp -r "${srcdir}/bin" "${_libdst}/bin"
	install -D -m 0755 "${srcdir}/TogglDesktop.sh" "${pkgdir}/usr/bin/TogglDesktop.sh"

	cp -r "${srcdir}/lib" "${_libdst}/lib"

	cp -r "${srcdir}/share" "${pkgdir}/usr/share"
}

# Maintainer: Gerson Minichiello <gerson dot minichiello at gmail dot com>
# Contributor: Radim Sückr <kontakt at radimsuckr dot cz>
# Contributor: Whezzel <whezzel at gmail dot com>
# Contributor: Karel Louwagie <karel at louwagie dot net>
# Contributor: Samuel Walladge <samuel at swalladge dot id dot au>
# Contributor: Yurii Kolesnykov <root at yurikoles dot com>

pkgname=toggldesktop-bin
_pkgname=toggldesktop
pkgver=7.5.363
pkgrel=1
pkgdesc='Toggl time tracking software'
arch=('x86_64')
provides=('toggldesktop')
conflicts=(
	'toggldesktop'
)
url='https://github.com/toggl-open-source/toggldesktop'
source=('toggldesktop.tar.gz::https://github.com/toggl-open-source/toggldesktop/releases/download/v7.5.363/toggldesktop_linux_7.5.363_x86_64.tar.gz')
sha512sums=('49b418007c77f2bee6aec2754f1b013e96fb48b9ac6d0e8de3bd67b5c69986859a5e1eae159c3a45b3e21cd32cbaa32cf0b450ded54d7192a10021386c29c36e')

package() {
	# Path taken from TogglDesktop.sh
	_libdst="${pkgdir}/usr/lib/toggldesktop"
	mkdir -p ${_libdst}

	cp -r "${srcdir}/bin" "${_libdst}/bin"
	install -D -m 0755 "${srcdir}/TogglDesktop.sh" "${pkgdir}/usr/bin/TogglDesktop.sh"

	cp -r "${srcdir}/lib" "${_libdst}/lib"

	cp -r "${srcdir}/share" "${pkgdir}/usr/share"
}

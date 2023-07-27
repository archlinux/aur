# Maintainer: Markus Hartung <mail@hartmark.se>

_pkgname=pdx-unlimiter
_binname=Pdx-Unlimiter
pkgname=pdx-unlimiter-deb
pkgver=2.13.2
pkgrel=1
pkgdesc='Pdx-Unlimiter is a savegame manager for all major Paradox Grand Strategy games'
arch=('x86_64')
license=('GPL3')
url='https://github.com/crschnick/pdx_unlimiter'
depends=(alsa-lib libxext libxi java-runtime glibc
	 libxrender libxtst libx11 zlib freetype2 bash)
optdepends=()

provides=("$_pkgname")
conflicts=()
source=('https://github.com/crschnick/pdxu_launcher/releases/latest/download/pdxu_installer-linux.deb')
md5sums=('44fd5b581d0aa4c77aea29b2bc0b7f5d')

package() {
	cd "${srcdir}"
	tar -xf data.tar.xz -C "${pkgdir}"

	mkdir -p "${pkgdir}/usr/bin"
	ln -s "/opt/${_pkgname}/bin/${_binname}" "${pkgdir}/usr/bin/${_pkgname}"

	# Fix permissions
	chmod -R go-w "${pkgdir}"
}

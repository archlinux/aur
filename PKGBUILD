# Contributor: Eric Fung <loseurmarbles at gmail dot com>
# Contributor: Alvaro F. García <https://rainbyte.github.io>
# Contributor: Daniel Milde <daniel at milde dot cz>
# Contributor: Eric Forgeot < http://anamnese.online.fr >

pkgname=pharo-bin
_pkgname=pharo
pkgver=9.0
pkgrel=1
pkgdesc='Implementation of the object-oriented, dynamically typed programming language Smalltalk'
arch=('x86_64' 'i686')
url='https://pharo.org/'
license=('MIT')
depends=('alsa-lib' 'libvorbis' 'pango' 'mesa' 'dbus' 'libxml2')

source_x86_64=('https://files.pharo.org/get-files/90/pharo64-linux-stable.zip')
source_i686=('https://files.pharo.org/get-files/90/pharo-linux-stable.zip')
source=('http://files.pharo.org/media/logo/icon-512x512.png'
        "${_pkgname}.sh"
	"${_pkgname}.desktop")
sha256sums_x86_64=('335ef612844a7bd3147b484d411a7a9512f849f14f430fe7553fac7d81f4676b')
sha256sums_i686=('265737cf7723b71a20dfa430554ca333b9987e6ff513a135eddd6727ba21547f')
sha256sums=('5a6f40722264a2befc9aea1dace399f2491cd45a98987458660f8a39d4e6887e'
            'b160f1303f79255148c11c5625644cd42e5aea6e51de19ef4858c925e31baff0'
            '68b96be66d14a9ad129016b2b59fc73a25ca92091a5869e9ae8960470b19f273')

package() {
	# copy executables and libs
	install -d "${pkgdir}/opt/${_pkgname}"
	cp -a "${srcdir}/bin" "${pkgdir}/opt/${_pkgname}"
	cp -a "${srcdir}/lib" "${pkgdir}/opt/${_pkgname}"

	# make symlinks
	install -Dm755 "${srcdir}/${_pkgname}.sh" "${pkgdir}/usr/bin/${_pkgname}"

	# copy icons
	install -Dm644 "${srcdir}/icon-512x512.png" "${pkgdir}/usr/share/pixmaps/$pkgname.png"

	# copy .desktop files
	install -Dm644 "${srcdir}/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
}

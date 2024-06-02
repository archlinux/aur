# Maintainer: jswagner <jason-at-jason;s.wagner*dot,com>
# Contributor: KickMeElmo
_prgname=MPF.Check
pkgname=mpf-check-bin
url="https://github.com/SabreTools/MPF"
arch=('x86_64')
license=('GPL3')
options=('!strip' '!debug')
pkgdesc="Media Preservation Frontend for Aaru and Redumper in C# (CLI Version)"
provides=('mpf-check')
pkgver=3.1.9a
pkgrel=1
source=('https://github.com/SabreTools/MPF/releases/download/3.1.9/MPF.Check_3.1.9a_net8.0_linux-x64_release.zip'
'https://raw.githubusercontent.com/SabreTools/MPF/master/README.md'
'https://raw.githubusercontent.com/SabreTools/MPF/master/LICENSE')
sha256sums=('c792c35a7cd0a239b05f3d5e77bfa5f67a09a183194d3498f1d9c7637f6713ed'
'SKIP'
'SKIP')

package() {

	# install mpf-check distribution
	install -Dm 755 ${srcdir}/${_prgname} ${pkgdir}/usr/bin/${_prgname}
	install -Dm 644 ${srcdir}/${_prgname}.dll.config \
		${pkgdir}/usr/lib/${_prgname}/${_prgname}.dll.config
	install -Dm 644 ${srcdir}/CascLib.dll \
		${pkgdir}/usr/lib/${_prgname}/CascLib.dll
	install -Dm 644 ${srcdir}/libAaru.Checksums.Native.so \
		${pkgdir}/usr/lib/${_prgname}/libAaru.Checksums.Native.so
	install -Dm 644 ${srcdir}/libblake3_dotnet.so \
		${pkgdir}/usr/lib/${_prgname}/libblake3_dotnet.so
	install -Dm 644 ${srcdir}/mspack.dll \
		${pkgdir}/usr/lib/${_prgname}/mspack.dll
	install -Dm 644 ${srcdir}/StormLib.dll \
		${pkgdir}/usr/lib/${_prgname}/StormLib.dll

	# install documentation
	install -Dm 644 ${srcdir}/README.md \
		${pkgdir}/usr/local/share/doc/${_prgname}/README.md

	# install license
	install -Dm 644 ${srcdir}/LICENSE \
		${pkgdir}/usr/share/licenses/${_prgname}/LICENSE

}

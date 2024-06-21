# Maintainer: jswagner <jason-at-jason;swag'ner*dot,com>
_prgname=burnoutsharp
pkgname=burnoutsharp-bin
url="https://github.com/mnadareski/BurnOutSharp"
arch=('x86_64')
license=('MIT')
options=('!strip')
pkgdesc="Protection, packer, and archive scanning library"
provides=('burnoutsharp')
pkgver=3.1.13
pkgrel=1
source=('https://github.com/SabreTools/BinaryObjectScanner/releases/download/3.1.13/BinaryObjectScanner_3.1.13_net8.0_linux-x64_release.zip'
'https://raw.githubusercontent.com/mnadareski/BurnOutSharp/master/README.md'
'https://raw.githubusercontent.com/mnadareski/BurnOutSharp/master/LICENSE')
sha256sums=('216324646cbe50f8450fe3fe76815daad5064a8efe693705649851954b8873b8'
'SKIP'
'SKIP')

package() {

	# install burnoutsharp distribution
	install -Dm 755 ${srcdir}/Test ${pkgdir}/usr/bin/${_prgname}
	install -Dm 775 ${srcdir}/CascLib.dll \
		${pkgdir}/usr/lib/${_prgname}/CascLib.dll
	install -Dm 775 ${srcdir}/libAaru.Checksums.Native.so \
		${pkgdir}/usr/lib/${_prgname}/libAaru.Checksums.Native.so
	install -Dm 775 ${srcdir}/libblake3_dotnet.so \
		${pkgdir}/usr/lib/${_prgname}/libblake3_dotnet.so
	install -Dm 775 ${srcdir}/mspack.dll \
		${pkgdir}/usr/lib/${_prgname}/mspack.dll
	install -Dm 775 ${srcdir}/StormLib.dll \
		${pkgdir}/usr/lib/${_prgname}/StormLib.dll

	# install documentation
	install -Dm 644 ${srcdir}/README.md ${pkgdir}/usr/local/share/doc/${_prgname}/README.md

	# install license
	install -Dm 644 ${srcdir}/LICENSE ${pkgdir}/usr/share/licenses/${_prgname}/LICENSE

}

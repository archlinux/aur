# Maintainer: jswagner <jason-at-jason;swag'ner*dot,com>
_prgname=burnoutsharp
pkgname=burnoutsharp-bin
url="https://github.com/mnadareski/BurnOutSharp"
arch=('x86_64')
license=('MIT')
options=('!strip')
pkgdesc="Protection, packer, and archive scanning library"
provides=('burnoutsharp')
pkgver=3.1.4
pkgrel=1
source=('https://github.com/SabreTools/BinaryObjectScanner/releases/download/3.1.4/BinaryObjectScanner_3.1.4_net8.0_linux-x64_release.zip'
'https://raw.githubusercontent.com/mnadareski/BurnOutSharp/master/README.md'
'https://raw.githubusercontent.com/mnadareski/BurnOutSharp/master/LICENSE')
sha256sums=('0e4ab80e35ed6d0a7584e16909ad3d7d4fbf2bce4a92106778d46326e092eee9'
'SKIP'
'SKIP')

package() {

	# install burnoutsharp distribution
	install -Dm 755 ${srcdir}/Test ${pkgdir}/usr/bin/${_prgname}
	install -Dm 775 ${srcdir}/libAaru.Checksums.Native.so \
		${pkgdir}/usr/lib/${_prgname}/libAaru.Checksums.Native.so
	install -Dm 775 ${srcdir}/libblake3_dotnet.so \
		${pkgdir}/usr/lib/${_prgname}/libblake3_dotnet.so

	# install documentation
	install -Dm 644 ${srcdir}/README.md ${pkgdir}/usr/local/share/doc/${_prgname}/README.md

	# install license
	install -Dm 644 ${srcdir}/LICENSE ${pkgdir}/usr/share/licenses/${_prgname}/LICENSE

}

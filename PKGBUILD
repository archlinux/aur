# Maintainer: jswagner <jason-at-jason;swag'ner*dot,com>
_prgname=burnoutsharp
pkgname=burnoutsharp-bin
url="https://github.com/mnadareski/BurnOutSharp"
arch=('x86_64')
license=('MIT')
options=('!strip')
pkgdesc="Protection, packer, and archive scanning library"
provides=('burnoutsharp')
pkgver=3.1.12
pkgrel=1
source=('https://github.com/SabreTools/BinaryObjectScanner/releases/download/3.1.12/BinaryObjectScanner_3.1.12_net8.0_linux-x64_release.zip'
'https://raw.githubusercontent.com/mnadareski/BurnOutSharp/master/README.md'
'https://raw.githubusercontent.com/mnadareski/BurnOutSharp/master/LICENSE')
sha256sums=('0d9e1702cdbef2c566a5fb0b576476835274ce2359df56867796823e6f0e3164'
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

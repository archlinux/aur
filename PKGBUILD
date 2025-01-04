# Maintainer: jswagner <jason-at-jason;swag'ner*dot,com>
_prgname=ProtectionScan
pkgname=burnoutsharp-bin
url="https://github.com/SabreTools/BinaryObjectScanner"
arch=('x86_64')
license=('MIT')
options=('!strip')
pkgdesc="Protection, packer, and archive scanning library"
provides=('burnoutsharp' 'binaryobjectscanner')
pkgver=3.3.4
pkgrel=1
source=('https://github.com/SabreTools/BinaryObjectScanner/releases/download/3.3.4/ProtectionScan_3.3.4_net9.0_linux-x64_release.zip'
'https://raw.githubusercontent.com/mnadareski/BurnOutSharp/master/README.md'
'https://raw.githubusercontent.com/mnadareski/BurnOutSharp/master/LICENSE')
sha256sums=('d611804da95719a86afb191f0c03c655c89288fe9c949bea3474dcac5d45b7cc'
'SKIP'
'SKIP')

package() {

	# install burnoutsharp distribution
	install -Dm 755 ${srcdir}/ProtectionScan ${pkgdir}/usr/bin/${_prgname}
	install -Dm 775 ${srcdir}/libblake3_dotnet.so \
		${pkgdir}/usr/lib/${_prgname}/libblake3_dotnet.so

	# install documentation
	install -Dm 644 ${srcdir}/README.md ${pkgdir}/usr/local/share/doc/${_prgname}/README.md

	# install license
	install -Dm 644 ${srcdir}/LICENSE ${pkgdir}/usr/share/licenses/${_prgname}/LICENSE

}

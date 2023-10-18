# Maintainer: jswagner <jason-at-jason;s.wagner*dot,com>
# Contributor: KickMeElmo
_prgname=MPF.Check
pkgname=mpf-check-bin
url="https://github.com/SabreTools/MPF"
arch=('x86_64')
pkgdesc="Media Preservation Frontend for Aaru and Redumper in C# (CLI Version)"
provides=('mpf-check')
pkgver=2.7.2
pkgrel=2
license=('GPL3')
source=('https://github.com/SabreTools/MPF/releases/download/2.7.2/MPF.Check_2.7.2_net7.0_linux-x64_release.zip'
'https://raw.githubusercontent.com/SabreTools/MPF/master/README.md'
'https://raw.githubusercontent.com/SabreTools/MPF/master/LICENSE')
sha256sums=('c371500213837032a7cec0b9c0e0a424a79b79072d692d8bc5f798a83843c611'
'SKIP'
'SKIP')
options=('!strip')

package() {

	# install mpf-check distribution
	install -Dm 755 ${srcdir}/${_prgname} ${pkgdir}/usr/bin/${_prgname}
	install -Dm 644 ${srcdir}/MPF.Check.dll.config \
		${pkgdir}/usr/lib/${_prgname}/MPF.Check.dll.config

	# install documentation
	install -Dm 644 ${srcdir}/README.md \
		${pkgdir}/usr/local/share/doc/${_prgname}/README.md

	# install license
	install -Dm 644 ${srcdir}/LICENSE \
		${pkgdir}/usr/share/licenses/${_prgname}/LICENSE

}

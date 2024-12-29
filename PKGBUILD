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
pkgver=3.2.4
pkgrel=1
source=('https://github.com/SabreTools/MPF/releases/download/3.2.4/MPF.Check_3.2.4_net9.0_linux-x64_release.zip'
'https://raw.githubusercontent.com/SabreTools/MPF/master/README.md'
'https://raw.githubusercontent.com/SabreTools/MPF/master/LICENSE')
sha256sums=('ee978abebde320c444b73f2a7256c23de6c755a889fd0d84612c7a0d925536ba'
'SKIP'
'SKIP')

package() {

	# install mpf-check distribution
	install -Dm 755 ${srcdir}/${_prgname} ${pkgdir}/usr/bin/${_prgname}
	install -Dm 644 ${srcdir}/${_prgname}.dll.config \
		${pkgdir}/usr/lib/${_prgname}/${_prgname}.dll.config
	install -Dm 644 ${srcdir}/libblake3_dotnet.so \
		${pkgdir}/usr/lib/${_prgname}/libblake3_dotnet.so

	# install documentation
	install -Dm 644 ${srcdir}/README.md \
		${pkgdir}/usr/local/share/doc/${_prgname}/README.md

	# install license
	install -Dm 644 ${srcdir}/LICENSE \
		${pkgdir}/usr/share/licenses/${_prgname}/LICENSE

}

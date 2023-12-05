# Maintainer: jswagner <jason-at-jason;s.wagner*dot,com>
# Contributor: KickMeElmo
_prgname=MPF.Check
pkgname=mpf-check-bin
url="https://github.com/SabreTools/MPF"
arch=('x86_64')
license=('GPL3')
options=('!strip')
pkgdesc="Media Preservation Frontend for Aaru and Redumper in C# (CLI Version)"
provides=('mpf-check')
pkgver=3.0.3
pkgrel=1
source=('https://github.com/SabreTools/MPF/releases/download/3.0.3/MPF.Check_3.0.3_net8.0_linux-x64_release.zip'
'https://raw.githubusercontent.com/SabreTools/MPF/master/README.md'
'https://raw.githubusercontent.com/SabreTools/MPF/master/LICENSE')
sha256sums=('a9f0738162b32e951a84e07d23ff975aab9c4ce06e65a79c6541672ef445059d'
'SKIP'
'SKIP')

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

# Maintainer: jswagner <jason-at-jason;s.wagner*dot,com>
# Contributor: KickMeElmo
_prgname=MPF.Check
pkgname=mpf-check-bin
url="https://github.com/SabreTools/MPF"
arch=('x86_64')
pkgdesc="Media Preservation Frontend for Aaru and Redumper in C# (CLI Version)"
provides=('mpf-check')
pkgver=2.6.6
pkgrel=2
license=('GPL3')
source=('https://github.com/SabreTools/MPF/releases/download/2.6.6/MPF.Check_2.6.6-net7.0_linux-x64.zip'
'https://raw.githubusercontent.com/SabreTools/MPF/master/README.md'
'https://raw.githubusercontent.com/SabreTools/MPF/master/LICENSE')
sha256sums=('1cedcc285d3e9d85b2f6abb675f80359ae0eb9062a37602de3b8f2afb30dcc5b'
'SKIP'
'SKIP')
options=('!strip')

package() {

	# install mpf-check distribution
	install -Dm 755 ${srcdir}/MPF.Check ${pkgdir}/usr/bin/MPF.Check
	install -Dm 644 ${srcdir}/MPF.Check.dll.config ${pkgdir}/usr/lib/${_prgname}/MPF.Check.dll.config
	install -Dm 644 ${srcdir}/MPF.Check.pdb ${pkgdir}/usr/lib/${_prgname}/MPF.Check.pdb
	install -Dm 644 ${srcdir}/MPF.Core.pdb ${pkgdir}/usr/lib/${_prgname}/MPF.Core.pdb
	install -Dm 644 ${srcdir}/MPF.Library.pdb ${pkgdir}/usr/lib/${_prgname}/MPF.Library.pdb
	install -Dm 644 ${srcdir}/MPF.Modules.pdb ${pkgdir}/usr/lib/${_prgname}/MPF.Modules.pdb

	# install documentation
	install -Dm 644 ${srcdir}/README.md ${pkgdir}/usr/local/share/doc/${_prgname}/README.md

	# install license
	install -Dm 644 ${srcdir}/LICENSE ${pkgdir}/usr/share/licenses/${_prgname}/LICENSE

}

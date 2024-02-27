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
pkgver=3.1.1
pkgrel=1
source=('https://github.com/SabreTools/MPF/releases/download/3.1.2/MPF.Check_3.1.2_net8.0_linux-x64_release.zip'
'https://raw.githubusercontent.com/SabreTools/MPF/master/README.md'
'https://raw.githubusercontent.com/SabreTools/MPF/master/LICENSE')
sha256sums=('9db8793d888641c1d95ced7b965132636cc0da00cdf7f17fb1bf7415ce8cb3bc'
'SKIP'
'SKIP')

package() {

	# install mpf-check distribution
	install -Dm 755 ${srcdir}/${_prgname} ${pkgdir}/usr/bin/${_prgname}
	install -Dm 644 ${srcdir}/MPF.Check.dll.config \
		${pkgdir}/usr/lib/${_prgname}/MPF.Check.dll.config
	install -Dm 644 ${srcdir}/CascLib.dll \
		${pkgdir}/usr/lib/${_prgname}/CascLib.dll
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

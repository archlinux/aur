# Maintainer: jswagner <jason-at-jason;s.wagner*dot,com>
# Contributor: KickMeElmo
_prgname=MPF.Check
pkgname=mpf-check-bin
arch=('x86_64')
conflicts=('mpf-check')
license=('GPL3')
options=('!strip' '!debug')
pkgdesc="Media Preservation Frontend for Aaru and Redumper in C# (CLI Version)"
provides=('mpf-check')
pkgver=3.8.3
pkgrel=1
url="https://github.com/SabreTools/MPF"

source=("${url}/releases/download/${pkgver}/${_prgname}_${pkgver}_net10.0_linux-x64_release.zip"
"https://raw.githubusercontent.com/SabreTools/MPF/master/README.md"
"https://raw.githubusercontent.com/SabreTools/MPF/master/LICENSE")

sha256sums=('c080a8e0bb1516809617b278bd13bc246414abe8c4a844d4450abc4f11022f4c'
'SKIP'
'SKIP')

package() {

	# install mpf-check distribution
	install -Dm 755 ${srcdir}/${_prgname} ${pkgdir}/usr/bin/${_prgname}

	# install documentation
	install -Dm 644 ${srcdir}/README.md \
		${pkgdir}/usr/local/share/doc/${_prgname}/README.md

	# install license
	install -Dm 644 ${srcdir}/LICENSE \
		${pkgdir}/usr/share/licenses/${_prgname}/LICENSE

}

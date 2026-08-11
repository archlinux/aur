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
pkgver=3.9.0
pkgrel=1
url="https://github.com/SabreTools/MPF"

source=("${url}/releases/download/${pkgver}/${_prgname}_${pkgver}_net10.0_linux-x64_release.zip"
"https://raw.githubusercontent.com/SabreTools/MPF/master/README.md"
"https://raw.githubusercontent.com/SabreTools/MPF/master/LICENSE")

sha256sums=('37fbe9d210ef574a7040bf4e8a2c5032a0f8d0d6bc578c98d0c00bf01b708c57'
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

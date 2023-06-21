# Maintainer: jswagner <jason-at-jason;s.wagner*dot,com>
_prgname=redumper
pkgname=redumper-bin
url="https://github.com/superg/redumper"
arch=('x86_64')
pkgdesc="Low level CD dumper utility"
provides=('redumper')
pkgver=build_175
pkgrel=1
_pkgfilename="redumper-2023.06.20_build175-Linux" # deviation from release tag, inclusion of date makes archive name nondeterministic :(
license=('GPL3')
source=('https://github.com/superg/redumper/releases/download/build_175/redumper-2023.06.20_build175-Linux.zip'
'https://raw.githubusercontent.com/superg/redumper/main/README.md'
'https://raw.githubusercontent.com/superg/redumper/main/LICENSE')
sha256sums=('4f76d7bccc515a930f42aca998575df0e34dcd08c582106ad782007171b369fa'
'SKIP'
'SKIP')

package() {

	# install binary
	install -Dm 755 ${srcdir}/${_pkgfilename}/bin/redumper ${pkgdir}/usr/bin/${_prgname}

	# install documentation
	install -Dm 644 ${srcdir}/README.md ${pkgdir}/usr/local/share/doc/${_prgname}/README.md

	# install license
	install -Dm 644 ${srcdir}/LICENSE ${pkgdir}/usr/share/licenses/${_prgname}/LICENSE

}

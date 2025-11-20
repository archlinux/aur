# Maintainer: jswagner <jason-at-jason;s.wagner*dot,com>
_prgname=redumper
pkgname=redumper-bin
url="https://github.com/superg/redumper"
arch=('x86_64')
pkgdesc="Low level CD dumper utility"
provides=('redumper')
pkgver=r664
pkgrel=1
_pkgfilename="redumper-b664-linux-x64" # deviation from release tag, inclusion of date makes archive name nondeterministic :(
license=('GPL3')
source=('https://github.com/superg/redumper/releases/download/b664/redumper-b664-linux-x64.zip'
'https://raw.githubusercontent.com/superg/redumper/main/README.md'
'https://raw.githubusercontent.com/superg/redumper/main/LICENSE')
sha256sums=('412c6782d1f62af1dd1934207e6aef5a1b77ca50c76b4172f8aeb900cbd6f457'
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

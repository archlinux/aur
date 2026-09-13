# Previous Maintainer: jswagner <jason-at-jason;s.wagner*dot,com>
# Maintainer: jessienab <git at nabein dot me>

_prgname=redumper
pkgname=redumper-bin
url="https://github.com/superg/redumper"
arch=('x86_64')
pkgdesc="Low level CD dumper utility"
provides=('redumper')
pkgver=b751
pkgrel=1
license=('GPL3')

# redumper-gui is pre-packaged with a supported and recommended version of redumper, therefore this package and the GUI cannot co-exist. Generally the version of redumper in redumper-gui follows redumper releases.
conflicts=(
    "redumper-gui-bin"
    "redumper-bin"
    "redumper"
)

source=("https://github.com/superg/redumper/releases/download/$pkgver/redumper-$pkgver-linux-x64.zip"
'https://raw.githubusercontent.com/superg/redumper/main/README.md'
'https://raw.githubusercontent.com/superg/redumper/main/LICENSE')
sha256sums=('9c8260b9727800e3af6037efda272022497ea41b98b02cac623c45a17c592ac4'
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

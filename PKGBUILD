# Previous Maintainer: jswagner <jason-at-jason;s.wagner*dot,com>
# Maintainer: jessienab <git at nabein dot me>

_prgname=redumper
pkgname=redumper-bin
url="https://github.com/superg/redumper"
arch=('x86_64')
pkgdesc="Low level CD dumper utility"
provides=('redumper')

# The previous maintainer set pkgver against what Media Preservation Frontend had bundled. However, the lead maintainer (superg) has recommended to simply use the latest. There's also no conflicts with redump or no-intro project submissions by using the latest version.
pkgver=b765
pkgrel=1
license=('GPL3')

_pkgfilename=redumper-$pkgver-linux-x64

# redumper-gui is pre-packaged with a supported and recommended version of redumper, therefore this package and the GUI cannot co-exist; generally the version of redumper in redumper-gui follows recent release builds.

conflicts=(
    "redumper-gui-bin"
    "redumper-gui"
    "redumper-git"
    "redumper"
)

source=("https://github.com/superg/redumper/releases/download/$pkgver/redumper-$pkgver-linux-x64.zip"
'https://raw.githubusercontent.com/superg/redumper/main/README.md'
'https://raw.githubusercontent.com/superg/redumper/main/LICENSE')

sha256sums=('04dd1465dd7a8dad336358df099836e935d1c556847c7f09a1526dbb985584c1'
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

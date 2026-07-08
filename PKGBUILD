# Maintainer: jessienab <git at nabein dot me>

pkgname=redumper-gui-bin
epoch=
pkgver=1.0.1
pkgrel=1
pkgdesc='A cross-platform digital fidget spinner and GUI for redumper.'
arch=(x86_64)
url='https://github.com/Deterous/Redumper-GUI'
license=('GPL-3.0')

# The GUI is pre-packaged with a supported and recommended version of redumper therefore, this must be present on the system. Generally this follows redumper git upstream builds.
# The redumper-bin AUR package is only updated when Media Preservation Frontend (MPF) marks a redumper version as "safe", or based on "safe" Redump.org version

depends=(
    redumper=729-1
)

conflicts=('redumper-gui')

source=(
#    "$pkgname-$pkgver.tar.gz::https://github.com/Deterous/Redumper-GUI/archive/refs/tags/Redumper-GUI-$pkgver.tar.gz"
    "https://github.com/Deterous/Redumper-GUI/releases/download/v${pkgver}/Redumper-GUI-Linux-x64.tar.gz"
    "https://raw.githubusercontent.com/Deterous/Redumper-GUI/refs/heads/main/LICENSE"
    "https://raw.githubusercontent.com/Deterous/Redumper-GUI/refs/heads/main/README.md"
)

sha256sums=('ca55fa2a562a2ee3e30c86ff1605f5268ee6347d63ecf87a44ab9fd394d6bcc4'
'SKIP'
'SKIP')

package() {

	# install binary
	install -Dm 755 ${srcdir}/redumper-gui ${pkgdir}/usr/bin/redumper-gui

	# install documentation
	install -Dm 644 ${srcdir}/README.md ${pkgdir}/usr/local/share/doc/${_prgname}/README.md

	# install license
	install -Dm 644 ${srcdir}/LICENSE ${pkgdir}/usr/share/licenses/${_prgname}/LICENSE

}

# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Stephen Martin <hwkiller at gmail dot com>
pkgname=onyx-sem
_pkgname=onyx
pkgver=1.0.1040
_pkgver="1.0-1040"
pkgrel=1
pkgdesc="A graphical interface for Structural Equation Modeling"
arch=('any')
url="http://onyx.brandmaier.de"
license=('custom')
depends=('java-runtime')
backup=()
options=()
install="onyx.install"
source=("${url}/${_pkgname}-${_pkgver}.jar"
	"onyx.svg"
	"LICENSE")
package() {
	install -Dm755 $srcdir/${_pkgname}-${_pkgver}.jar $pkgdir/usr/share/java/${pkgname}/${_pkgname}.jar
	mkdir $pkgdir/usr/share/applications/
	cat > $pkgdir/usr/share/applications/${pkgname}.desktop << "EOF"
[Desktop Entry]
Type=Application
Version=1.0
Name=Onyx
Comment=A graphical interface for Structural Equation Modeling
Exec=/usr/bin/java -jar /usr/share/java/onyx-sem/onyx.jar
Categories=Science;Education
Icon=onyx
GenericName=Latent Variable Modeling Program
EOF

	install -Dm755 $srcdir/${_pkgname}.svg $pkgdir/usr/share/icons/hicolor/scalable/apps/${_pkgname}.svg
	install -Dm 644 $srcdir/LICENSE $pkgdir/usr/share/licenses/${pkgname}/LICENSE
}
md5sums=('03c64d74e1032a7c40f7b2aaf44f508c'
         'a82f98998f19b746d4f7d7956a38c11c'
         'adc8301181bc7ba30838a0fd327a471c')

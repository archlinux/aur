# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Stephen Martin <hwkiller at gmail dot com>
pkgname=onyx-sem
_pkgname=onyx
pkgver=2021.08
_pkgver="2021/08"
pkgrel=1
pkgdesc="A graphical interface for Structural Equation Modeling"
arch=('any')
url="http://onyx.brandmaier.de"
license=('custom')
depends=('java-runtime')
backup=()
options=()
install="onyx.install"
source=("https://onyx-sem.com/wp-content/uploads/${_pkgver}/onyx-stable.jar"
	"onyx.svg"
	"LICENSE")
package() {
	install -Dm755 $srcdir/${_pkgname}-stable.jar $pkgdir/usr/share/java/${pkgname}/${_pkgname}.jar
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
md5sums=('f74b4b0647e61f3561d3ed0c3b695b16'
         'a82f98998f19b746d4f7d7956a38c11c'
         'adc8301181bc7ba30838a0fd327a471c')

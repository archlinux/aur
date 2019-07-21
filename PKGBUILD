# Maintainer: Ryozuki <ryo@ryozuki.xyz>
pkgname=digital
pkgver=0.22
pkgrel=1
pkgdesc="A digital logic designer and circuit simulator."
arch=('x86_64')
url="https://github.com/hneemann/Digital"
license=('GPL')
depends=('java-runtime')
source=("https://github.com/hneemann/Digital/releases/download/v${pkgver}/Digital.zip"
    "digital.desktop")
sha256sums=("f449e1f7baaf04a2fde43b9c710df2b2051a17cedba02e0b3235b0984663b739"
    "cec54a264aa24c5116521d0846b88da4e6a032ce85f484782d5ad222c024e29c")

prepare() {
	echo -e "#!/usr/bin/env bash\njava -jar /usr/share/java/$pkgname/$pkgname.jar" > "$srcdir/$pkgname.sh"
}

package() {
	install -vDm644 "$srcdir/Digital/docu/Documentation_en.pdf" "$pkgdir/usr/share/doc/$pkgname/documentation_en.pdf"
	install -vDm644 "$srcdir/Digital/docu/Documentation_de.pdf" "$pkgdir/usr/share/doc/$pkgname/documentation_de.pdf"
	install -vDm644 "$srcdir/Digital/docu/Documentation_pt.pdf" "$pkgdir/usr/share/doc/$pkgname/documentation_pt.pdf"
	install -vDm644 "$srcdir/Digital/ReleaseNotes.txt" "$pkgdir/usr/share/doc/$pkgname/changelog.txt"
	install -vDm644 "$srcdir/Digital/Digital.jar" "$pkgdir/usr/share/java/$pkgname/$pkgname.jar"
	install -vDm644 digital.desktop "$pkgdir/usr/share/applications/$pkgname/$pkgname.desktop"
	install -vDm755 "$srcdir/$pkgname.sh" "$pkgdir/usr/bin/$pkgname"
}

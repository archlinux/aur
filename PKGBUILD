# Maintainer: Jendrik <rua@jendrik.eu>
# Contributor: kaptoxic@yahoo.com
# Contributor: Thomas Lange <thomas-lange2@gmx.de>

pkgname=setlx
pkgver=2.7.2
pkgrel=1
pkgdesc='Interpreter for the SetlX programming language'
arch=('any')
url='http://randoom.org/Software/SetlX'
license=('BSD')
depends=('java-runtime')
source=(http://download.randoom.org/setlX/pc/setlX_v${pkgver//./-}.binary_only.zip
        LICENSE)
sha256sums=('f0afd23148a6cba0406bfea76cdce30fc447f347f297fbca884fffb63fbd2c5b'
            'c4ac68ea51527f7cc2859cac9f2fed74e9072fb7595a08d3f958cc2aa5fb99e5')

package() {
    sed -i 's|"."|"/usr/share/java/setlx/"|' setlX

    install -D -m755 setlX "${pkgdir}/usr/bin/${pkgname}"
    install -D -m644 setlX.jar "${pkgdir}/usr/share/java/${pkgname}/setlX.jar"
    install -D -m644 setlX-gfx.jar "${pkgdir}/usr/share/java/${pkgname}/setlX-gfx.jar"
    install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -D -m644 manual.pdf "${pkgdir}/usr/share/doc/${pkgname}/manual.pdf"
    install -D -m644 tutorial.pdf "${pkgdir}/usr/share/doc/${pkgname}/tutorial.pdf"
    install -D -m644 syntax_highlighting/gedit_GtkSourceView/setlx.lang \
      "${pkgdir}/usr/share/gtksourceview-3.0/language-specs/setlx.lang"
}

# Mantenedor: Felipe Alfonso Gonzalez <f.alfonso@res-ear.ch>
pkgname=term-pdf
pkgver=0.0.4.4
pkgrel=1
pkgdesc="TermPDF Viewer is an open-source PDF file viewer designed to run in the terminal."
arch=('x86_64')
url="https://github.com/felipealfonsog/TermPDFViewer"
license=('MIT')
depends=('gcc' 'python-pip' 'python-pymupdf' 'python-termcolor')
source=("https://github.com/felipealfonsog/TermPDFViewer/archive/refs/tags/v.${pkgver}.tar.gz")
sha256sums=('7111ba0d04ae16d01fc590e3838edf22e2afef69db2be522775e2ede0659f76a')

prepare() {
  tar xf "v.${pkgver}.tar.gz" -C "$srcdir" --strip-components=1
  # cp "$srcdir"/term-pdf-wrp.c "$srcdir"/TermPDFViewer-v."$pkgver"/src/
}
build() {
  cd "$srcdir"/TermPDFViewer-v."${pkgver}"
  gcc -o term-pdf-wrp "$srcdir"/TermPDFViewer-v."${pkgver}"/src/term-pdf-wrp.c
}
package() {
  install -Dm755 "$srcdir"/TermPDFViewer-v."${pkgver}"/src/term-pdf-wrp "${pkgdir}/usr/local/bin/term-pdf"
  install -Dm755 "$srcdir"/TermPDFViewer-v."${pkgver}"/src/termpdf.py "${pkgdir}/usr/local/bin/termpdf.py"
}

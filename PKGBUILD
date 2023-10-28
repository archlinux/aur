# Mantenedor: Felipe Alfonso Gonzalez <f.alfonso@res-ear.ch>
pkgname=term-pdf
pkgver=0.0.4.2
pkgrel=1
pkgdesc="TermPDF Viewer is an open-source PDF file viewer designed to run in the terminal."
arch=('x86_64')
url="https://github.com/felipealfonsog/TermPDFViewer"
license=('MIT')
depends=('gcc' 'python-pip' 'python-pymupdf' 'python-termcolor')
source=("https://github.com/felipealfonsog/TermPDFViewer/archive/refs/tags/v.${pkgver}.tar.gz")
sha256sums=('09550f803bee33d770751526555e7e458aec8a05979e7deb9d1e84e9d0ede079')

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

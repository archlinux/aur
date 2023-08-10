# Maintainer: Felipe Alfonso Gonzalez <f.alfonso@res-ear.ch>
pkgname=term-pdf
pkgver=0.0.2
pkgrel=1
pkgdesc="TermPDF Viewer is an open-source PDF file viewer designed to run in the terminal."
arch=('x86_64')
url="https://github.com/felipealfonsog/TermPDFViewer"
license=('MIT')
depends=('gcc' 'python-pip' 'python-pymupdf')

source=("https://github.com/felipealfonsog/TermPDFViewer/archive/refs/tags/v.${pkgver}.tar.gz")

sha256sums=('2ecc46c6385e98b3d9351fc0db4cef9b1d2d7aa00f8b3727100735f6c8858053')

prepare() {
  tar xf "v.${pkgver}.tar.gz" -C "$srcdir" --strip-components=1
  cd "$srcdir"/TermPDFViewer-v."$pkgver"
}

package() {
  cd "${srcdir}"/TermPDFViewer-v."${pkgver}"/dist/linux/termpdf-linux
  install -Dm755 termpdf-linux "${pkgdir}/usr/bin/termpdf"
}

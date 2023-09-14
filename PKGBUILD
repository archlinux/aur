# Maintainer: Felipe Alfonso Gonzalez <f.alfonso@res-ear.ch>
pkgname=term-pdf
pkgver=0.0.3
pkgrel=1
pkgdesc="TermPDF Viewer is an open-source PDF file viewer designed to run in the terminal."
arch=('x86_64')
url="https://github.com/felipealfonsog/TermPDFViewer"
license=('MIT')
depends=('python-pip' 'python-pymupdf')

source=("https://github.com/felipealfonsog/TermPDFViewer/archive/refs/tags/v.${pkgver}.tar.gz")

sha256sums=('686cf765766043001b8097e84d872abb4483117191374cc653a246322a95d266')

prepare() {
  tar xf "v.${pkgver}.tar.gz" -C "$srcdir" --strip-components=1
  cd "$srcdir"/TermPDFViewer-v."$pkgver"
}

package() {
  python "$srcdir"/TermPDFViewer-v."${pkgver}"/src/installer.py
}


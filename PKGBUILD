# Maintainer: Felipe Alfonso Gonzalez <f.alfonso@res-ear.ch>
pkgname=feather-pdf
pkgver=1.0.0
pkgrel=1
pkgdesc="FeatherPDF is an ultra-lightweight PDF viewer."
arch=('x86_64')
url="https://github.com/felipealfonsog/FeatherPDF"
license=('MIT')
depends=('python' 'python-pip' 'python-pyqt5')

source=("https://github.com/felipealfonsog/FeatherPDF/archive/refs/tags/v.${pkgver}.tar.gz")

sha256sums=('3e6da0582ebc599e5b624c899faec3ad78e69cce4e4cd0ce0d3529f279a5fd51')

prepare() {
  tar xf "v.${pkgver}.tar.gz" -C "$srcdir" --strip-components=1
  cd "$srcdir"/TermPDFViewer-v."$pkgver"
}

package() {
  cd "${srcdir}"/FeatherPDF-v."${pkgver}"/dist/linux/
  install -Dm755 featherpdf "${pkgdir}/usr/bin/feather-pdf"
}
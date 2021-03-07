# Maintainer: Hsiu-Ming Chang <cges30901 at gmail dot com>

pkgname=pdfhandoutcrop
pkgver=0.99.2
pkgrel=1
pkgdesc="A tool to crop pdf handout with multiple pages per sheet"
arch=(any)
url="https://cges30901.github.io/pdfhandoutcrop/"
license=('GPL3')
depends=('python-pypdf2' 'python-pyqt5' 'python-pymupdf')
source=("https://files.pythonhosted.org/packages/source/p/pdfhandoutcrop/pdfhandoutcrop-${pkgver}.tar.gz")
sha256sums=('e0cff97e28660cf733a621de402142dd42fd0628d8925943853b07ba8e2b5c6f')

build() {
  cd "$pkgname-$pkgver"
  python setup.py build
}

package() {
  cd "$pkgname-$pkgver"

  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
  install -D -m0644 pdfhandoutcrop.desktop $pkgdir/usr/share/applications/pdfhandoutcrop.desktop
  install -D -m0644 icons/128/pdfhandoutcrop.png $pkgdir/usr/share/icons/hicolor/128x128/apps/pdfhandoutcrop.png
  install -D -m0644 icons/48/pdfhandoutcrop.png $pkgdir/usr/share/icons/hicolor/48x48/apps/pdfhandoutcrop.png
}

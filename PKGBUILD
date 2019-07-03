# Maintainer: Hsiu-Ming Chang <cges30901 at gmail dot com>

pkgname=pdfhandoutcrop
pkgver=0.7.0
pkgrel=1
pkgdesc="A tool to crop pdf handout with multiple pages per sheet"
arch=(any)
url="https://cges30901.github.io/pdfhandoutcrop/"
license=('GPL3')
groups=()
depends=('python-pypdf2' 'python-pyqt5' 'python-pymupdf')
makedepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
changelog=
source=("https://files.pythonhosted.org/packages/source/p/pdfhandoutcrop/pdfhandoutcrop-${pkgver}.tar.gz")
noextract=()
md5sums=('f82eefca7d3acc977d577d279b1e02e0')

build() {
  cd "$pkgname-$pkgver"
  python setup.py build
}

package() {
  cd "$pkgname-$pkgver"

  python setup.py install --prefix=/usr --root="$pkgdir"
  install -D -m0644 pdfhandoutcrop.desktop $pkgdir/usr/share/applications/pdfhandoutcrop.desktop
  install -D -m0644 icons/128/pdfhandoutcrop.png $pkgdir/usr/share/icons/hicolor/128x128/apps/pdfhandoutcrop.png
  install -D -m0644 icons/48/pdfhandoutcrop.png $pkgdir/usr/share/icons/hicolor/48x48/apps/pdfhandoutcrop.png
}

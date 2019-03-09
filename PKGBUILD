# Maintainer: Hsiu-Ming Chang <cges30901 at gmail dot com>

pkgname=pdfhandoutcrop
pkgver=0.6.0
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
#install="$pkgname.install"
changelog=
source=("https://files.pythonhosted.org/packages/source/p/pdfhandoutcrop/pdfhandoutcrop-${pkgver}.tar.gz")
noextract=()
md5sums=('872e01b8bb31ac83b4b74831614c9033')

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

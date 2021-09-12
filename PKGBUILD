# Maintainer: Dmitry Kharitonov <arch[at]nano-model[dot]com>
# Contributor: Egon Geerardyn < egon DOT geerardyn AT gmail DOT com >
# Contributor: TDY <tdy@gmx.com>

pkgname=cb2bib
pkgver=2.0.1
pkgrel=1
pkgdesc="A tool for parsing clipboard data into BibTeX bibliographic database files"
arch=('i686' 'x86_64')
url="http://www.molspaces.com/cb2bib/"
license=('GPL3')
depends=('desktop-file-utils' 'qt5-webkit')
optdepends=('mathjax: for displaying mathematical notation'
            'openssl: network reference query support'
            'perl-image-exiftool: meta data support'
            'texlive-core: file correctness checking; bib2pdf printing'
            'xpdf: pdftotext support')
source=(http://www.molspaces.com/dl/progs/$pkgname-$pkgver.tar.gz)
sha256sums=('73f5c3224577dca1d6ffcde23afce7076ce4c3ff5dcab7d5d25cf7615562f027')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix /usr --qmakepath /usr/bin/qmake-qt5
  make -j1
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make INSTALL_ROOT="$pkgdir" install
}

pkgname=ktikz
pkgver=0.12
pkgrel=1
pkgdesc="A small application helping you to create TikZ diagrams (from the LaTeX pgf package)"
arch=('i686' 'x86_64')
url="http://www.hackenberger.at/blog/ktikz-editor-for-the-tikz-language/"
license=('GPL')
depends=('poppler-qt5' 'kdebase-runtime')
makedepends=('cmake' 'docbook-xml')
source=("https://github.com/fhackenberger/ktikz/archive/$pkgver.tar.gz")
md5sums=('3834a2c0c7d135eb7f958053a56c07ca')

build() {
  cd $pkgname-$pkgver
  mkdir buildqt
  cd buildqt
  qmake ../qtikz.pro
  make
}

package() {
  cd $pkgname
  make DESTDIR="$pkgdir" install
}


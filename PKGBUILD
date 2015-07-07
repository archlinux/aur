# See AUR interface for current maintainer.
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>
pkgname=emacs-mmm-mode  
pkgver=0.5.4
pkgrel=1
pkgdesc="minor mode for Emacs that allows Multiple Major Modes to \
coexist in one buffer"
url="http://mmm-mode.sourceforge.net/"
arch=('any')
provides=('mmm-mode')
conflicts=('mmm-mode')
license=('GPL')
install=mmm-mode.install
source=("https://github.com/purcell/mmm-mode/archive/$pkgver.tar.gz")
sha256sums=('db55529ba95f841826bee952e73e55b87d9c191004e7c985a9582eea2cd57c82')

build() {
  cd "$srcdir/${pkgname#emacs-}-$pkgver"
  ./configure --prefix=/usr --infodir=/usr/share/info
  make
}
package() {
  cd "$srcdir/${pkgname#emacs-}-$pkgver"
  make DESTDIR=$pkgdir install
}

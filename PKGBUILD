# Maintainer: David Runge <dvzrv@archlinux.org>

pkgname=patroneo
pkgver=1.4.1
pkgrel=2
pkgdesc="An easy to use pattern based midi sequencer"
arch=('x86_64')
url="https://www.laborejo.org/patroneo.git/"
license=('GPL3')
groups=('pro-audio')
depends=('glib2' 'glibc' 'hicolor-icon-theme' 'libjack.so' 'libncursesw.so'
'libsndfile' 'libuuid.so' 'python' 'python-pyqt5' 'ttf-dejavu')
makedepends=('nuitka' 'chrpath')
optdepends=('non-session-manager: Session management')
source=("https://www.laborejo.org/downloads/${pkgname}-${pkgver}.tar.gz"{,.sig})
sha512sums=('db436c684ca6615c2eb02ca7eba53e689c874fbfc8f039b1fe14a595660a4bd9185f96b0a7208cc44042f4666c1e286687cb5fc9d4fcc3faeee4b9bf9ad495ec'
            'SKIP')
validpgpkeys=('45D952EF384ADFBB00913E3428C6A306F2909FEE') # Nils Hilbricht <nils@hilbricht.com>

build() {
  cd "$pkgname-$pkgver"
  ./configure --prefix=/usr
  make
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}

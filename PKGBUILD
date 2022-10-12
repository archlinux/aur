# Maintainer: David Runge <dvzrv@archlinux.org>

pkgname=tembro
pkgver=0.6.0
pkgrel=1
pkgdesc="Virtual software instrument based on samples"
arch=(any)
url="https://laborejo.org/tembro/"
license=(GPL3)
groups=(pro-audio)
depends=(hicolor-icon-theme libcalfbox-lss python python-pyqt5 ttf-dejavu)
optdepends=('new-session-manager: for session management')
options=(debug)
source=(https://laborejo.org/downloads/$pkgname-$pkgver.tar.gz{,.sig})
sha512sums=('919a4eaf3d4f55cd133150d18139607a4edca8c67067cadd0ad423b2a3442a81cb6ada4204fb0219f11ad3a707aba20b8fb85ed7e8044cd6de1fdcd6ac64176c'
            'SKIP')
b2sums=('f2da2d49f2b08118a4c38fe6e75902cb7603d1ffeaa675b1105040414aa12ac1b4933d2d9e42072958aaef99d61f97fdd570a68f24f10f7be70a75a596d6cb17'
        'SKIP')
validpgpkeys=('45D952EF384ADFBB00913E3428C6A306F2909FEE') # Nils Hilbricht <nils@hilbricht.com>

build() {
  cd $pkgname-$pkgver
  ./configure --prefix=/usr
  make
}

package() {
  make DESTDIR="$pkgdir" install -C $pkgname-$pkgver
}

# Maintainer: David Runge <dvzrv@archlinux.org>

pkgname=patroneo
pkgver=2.3.2
pkgrel=1
pkgdesc="An easy to use pattern based midi sequencer"
arch=(any)
url="https://www.laborejo.org/patroneo/"
license=(GPL3)
groups=(pro-audio)
depends=(hicolor-icon-theme libcalfbox-lss python python-pyqt5 ttf-dejavu)
optdepends=('new-session-manager: for session management')
source=(https://www.laborejo.org/downloads/$pkgname-$pkgver.tar.gz{,.sig})
sha512sums=('562cd616e93f33a8b3aa1bb1461a6d56eb2c8a7fb92bcf9b5354a05f61569876fe352a8e0690251eda7e7a1f84185115714460d8a7e79453a47742ff9713ba9d'
            'SKIP')
b2sums=('3adbed883a1440ae48ad931a5bb1f7cefe2b34347dd6c62304f0335072b0dc1a34aec23a112c4604160fadb1ec5b264f822dd29e590113c7b0942b8b05cf5fdf'
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

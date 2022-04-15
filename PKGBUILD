# Maintainer: David Runge <dvzrv@archlinux.org>

pkgname=patroneo
pkgver=2.3.1
pkgrel=1
pkgdesc="An easy to use pattern based midi sequencer"
arch=(any)
url="https://www.laborejo.org/patroneo/"
license=(GPL3)
groups=(pro-audio)
depends=(hicolor-icon-theme libcalfbox-lss python python-pyqt5 ttf-dejavu)
optdepends=('new-session-manager: for session management')
source=(https://www.laborejo.org/downloads/$pkgname-$pkgver.tar.gz{,.sig})
sha512sums=('c17a40d6d4bba370f7dada316d81bde9d2c0f7dbb501eca0af8e3641f70de41aae34879222fb3e3f779f7a71865c2639c14be833c73e2371969822e8b04d3c0b'
            'SKIP')
b2sums=('e096bf1304ed5e09dfeda3c0c72280879f6f12cb9ea1fdcf15583a858b728ee9596b24d724fd706244b1786e1bb652478ea91d8fa8819156c04ba77d2f91847b'
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

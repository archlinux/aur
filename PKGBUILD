# Maintainer: David Runge <dave@sleepmap.de>

pkgname=patroneo
pkgver=1.4
pkgrel=1
pkgdesc="An easy to use pattern based midi sequencer"
arch=('x86_64')
url="https://www.laborejo.org/fluajho.git/"
license=('GPL3')
groups=('pro-audio')
depends=('glib2' 'glibc' 'hicolor-icon-theme' 'libjack.so' 'libsndfile'
'libusb-1.0.so' 'libuuid.so' 'python' 'python-pyqt5' 'ttf-dejavu')
makedepends=('nuitka' 'chrpath')
optdepends=('non-session-manager: Session management')
source=("https://www.laborejo.org/downloads/${pkgname}-${pkgver}.tar.gz"{,.sig})
sha512sums=('46353a17ff57cd5fb74320eff3b35741e0c09fc830aca7f0bbbf93c18cf4f1775ac8d35681842344a7d80b5ef754d64e9eafbefda3b98a03f976219a3af1672d'
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

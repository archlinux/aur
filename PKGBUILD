# Maintainer: David Runge <dave@sleepmap.de>

pkgname=patroneo
pkgver=1.3
pkgrel=1
pkgdesc="An easy to use pattern based midi sequencer"
arch=('x86_64')
url="https://www.laborejo.org/fluajho.git/"
license=('GPL3')
groups=('pro-audio')
depends=('hicolor-icon-theme' 'jack' 'python-pyqt5' 'ttf-dejavu')
makedepends=('nuitka' 'chrpath')
optdepends=('non-session-manager: Session management')
source=("https://www.laborejo.org/downloads/${pkgname}-${pkgver}.tar.gz"{,.sig})
sha512sums=('e813f0f459961773aa917fb466420e2c23b079055cd34b612aea781fba4b3e4373ed0bfd5d1e1a1bc293941bb3b9e533dbdddd25aebd033e4eabcbf3a401d4f7'
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

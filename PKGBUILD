# Maintainer: David Runge <dvzrv@archlinux.org>

pkgname=laborejo
pkgver=2.2.0
pkgrel=1
pkgdesc="MIDI sequencer based on classical music notation"
arch=(any)
url="https://laborejo.org/laborejo/"
license=(GPL3)
groups=(pro-audio)
depends=(hicolor-icon-theme libcalfbox-lss python python-pyqt5 ttf-dejavu)
optdepends=(
  'lilypond: for export to .ly and .pdf'
  'new-session-manager: for session management'
)
source=(https://laborejo.org/downloads/$pkgname-$pkgver.tar.gz{,.sig})
sha512sums=('2c5c150a6f880e59dc68fdc8a4a30fc9cac68bff82047895af0112cb1941078dc229d6ceebe736b4f79dbf1adfb16f5498d89947e3b6c955624e6ddabf80ab90'
            'SKIP')
b2sums=('93fdf63e00ad91a3dc70cdbe0c3fae27b68a975f08bafe3012a2b5f182c026970d081a76f590c94b14274534b2dba443d406fb28e722c6d4635263fed7b95585'
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

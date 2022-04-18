# Maintainer: David Runge <dvzrv@archlinux.org>

pkgname=laborejo
pkgver=2.0.3
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
sha512sums=('acc56f4dd0aa6189dbdc501512df5ebcdd69bb1e4c0c55c6d6fec40f261f0baf65412cbdc554bb2531e686635e129da4596c2eea9d605bbfb81d74640dfe6d5a'
            'SKIP')
b2sums=('a2cd51b84680c11b23cedf5f20943d06521e6cf3569884718fe9776afa147c75f6d13d0f679e425f44be70a7dedd49b819b646a4e2f0f9d030285b697738e0c3'
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

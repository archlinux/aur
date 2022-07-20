# Maintainer: David Runge <dvzrv@archlinux.org>

pkgname=laborejo
pkgver=2.1.0
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
sha512sums=('832509f789c0b097e0c4ffb5eccb4e98dae81bd357f4e5e09d80bd2bed84a859b7047100466a6b2e5d84ffcb0af5fd62df61ba2b60c2031ee22003545b6510a8'
            'SKIP')
b2sums=('52de611c39a233c3d57216dfea6d5f344c87d94a0ba0ccedf66ff9629a4c3c5733d568b4f461fbf22ebb0bbbaa013f3f851f8f0466d937af9a29405254b15f4a'
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

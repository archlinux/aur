# Maintainer: David Runge <dvzrv@archlinux.org>

pkgname=laborejo
pkgver=2.2.2
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
options=(debug)
source=(https://laborejo.org/downloads/$pkgname-$pkgver.tar.gz{,.sig})
sha512sums=('15b3babdf16287445db4a6536b7562364df1cfe2e21a60d30a13962e2f126c2175c5197c928fd4a8a4bb9411513e8799815329b30946d1798bea00b643767059'
            'SKIP')
b2sums=('8a6416ac4136fab9515ed98d4e9d415c9e8ff4dcb3a5d17a5d0c67b849a488654cdf868c63ec02e92178dfad27f5b4dfc2a5a4c9c8796b2050f03b64a96351ae'
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

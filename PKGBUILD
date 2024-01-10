# Maintainer: nicolarnaud <nicolas.rr.arnaud@gmail.com>``

pkgname=pianobooster-qt6-git
pkgver=latest
pkgrel=1
pkgdesc="PianoBooster is a free (Open Source) program that plays Standard Midi Files and allows you to change the speed of playback and transpose the music etc."
arch=('x86_64')
url="https://github.com/pianobooster/PianoBooster"
license=('GPL')
depends=('qt6-base' 'qt6-tools' 'qt6-tools-tools' 'qt6-5compat' 'ftgl' 'rtmidi' 'fluidsynth' 'fluid-soundfont-gm')
makedepends=('git' 'cmake' 'pkg-config')

source=("git+https://github.com/pianobooster/PianoBooster.git#branch=develop")

build() {
  cd "$srcdir/PianoBooster/build"
  cmake -DCMAKE_INSTALL_PREFIX=/usr -DQT_PACKAGE_NAME=Qt6 ..
  make -j$(nproc)
}

package() {
  cd "$srcdir/PianoBooster/build"
  make DESTDIR="$pkgdir/" install
}

sha256sums=('SKIP')

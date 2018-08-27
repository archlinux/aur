# Maintainer: Hsiu-Ming Chang <cges30901 at gmail dot com>
pkgname=hmtimer
pkgver=3.0.1
pkgrel=1
pkgdesc="graphical shutdown timer"
arch=('i686' 'x86_64')
url="https://cges30901.github.io/hmtimer-website/"
license=('GPL3')
groups=()
depends=('qt5-base' 'qt5-multimedia' 'hicolor-icon-theme')
makedepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install="$pkgname.install"
changelog=
source=("https://github.com/cges30901/hmtimer/releases/download/v$pkgver/hmtimer-$pkgver-src.tar.bz2")
noextract=()
md5sums=('f27076f333a7ab70a9ae744fcc642871')

build() {
  cd "$pkgname-$pkgver"
  qmake
  make
  gzip hmtimer.1
}

package() {
  cd "$pkgname-$pkgver"

  make INSTALL_ROOT="$pkgdir" install
  install -D -m0644 hmtimer.1.gz $pkgdir/usr/share/man/man1/hmtimer.1.gz
}

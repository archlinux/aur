# Maintainer: Carlo Capocasa <carlo@capocasa.net>
pkgname=phasex
pkgver=0.14.97
pkgrel=1
epoch=
pkgdesc="A high-precision MIDI software synthesizer built around flexible phase modulation and oscillator sources"
arch=(x86_64)
url="https://github.com/williamweston/phasex.git"
license=('GPL')
groups=()
depends=()
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=(
"$pkgname::git+https://github.com/williamweston/phasex.git#tag=0.14.97"
)
noextract=()
md5sums=(
"SKIP"
)
validpgpkeys=()

prepare() {
	cd "$pkgname"
  aclocal
  autoconf
	automake
	autoheader
  ./configure --enable-arch=native --enable-parts=2
}

build() {
	cd "$pkgname"
  make
}

check() {
  cd "$pkgname"
}

package() {
  cd "$pkgname"
  make DESTDIR="$pkgdir/" install
}



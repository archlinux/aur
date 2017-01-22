# Maintainer: Vaporeon <vaporeon@vaporeon.io>

pkgname=mednaffe-gtk2
pkgver=0.8.4
pkgrel=1
pkgdesc="front-end (GUI) for mednafen emulator (GTK2 Version)"
arch=('i686' 'x86_64')
url="https://sites.google.com/site/amatcoder/mednaffe"
license=('GPL')
depends=('mednafen' 'gtk2')
provides=('mednaffe')
conflicts=('mednaffe')
source=(https://sites.google.com/site/amatcoder/mednaffe/downloads/mednaffe-$pkgver.tar.gz)
sha1sums=('74a7283522b75eb5dda209595cbe434708fd608f')

build() {
  cd "$srcdir"/mednaffe-$pkgver
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir"/mednaffe-$pkgver
  make prefix="$pkgdir"/usr install
}

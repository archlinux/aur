# Maintainer: MasterLaser <vaporeon@vaporeon.io>

pkgname=mednaffe-gtk2
pkgver=0.8.3
pkgrel=1
pkgdesc="front-end (GUI) for mednafen emulator (GTK2 Version)"
arch=('i686' 'x86_64')
url="https://sites.google.com/site/amatcoder/mednaffe"
license=('GPL')
depends=('mednafen' 'gtk2')
provides=('mednaffe')
conflicts=('mednaffe')
source=(https://sites.google.com/site/amatcoder/mednaffe/downloads/mednaffe-$pkgver.tar.gz)
sha1sums=('e2e5b0dc3e5bb8cc975dfe860e6f4242577d10a4')

build() {
  cd "$srcdir"/mednaffe-$pkgver
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir"/mednaffe-$pkgver
  make prefix="$pkgdir"/usr install
}

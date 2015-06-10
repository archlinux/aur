# Maintainer: Duck Hunt <vaporeon@tfwno.gf>

pkgname=mednaffe-gtk2
pkgver=0.7
pkgrel=1
pkgdesc="front-end (GUI) for mednafen emulator (GTK2 Version)"
arch=('i686' 'x86_64')
url="https://sites.google.com/site/amatcoder/mednaffe"
license=('GPL')
install=mednaffe.install
depends=('mednafen' 'gtk2')
provides=('mednaffe')
conflicts=('mednaffe')
source=(https://sites.google.com/site/amatcoder/mednaffe/downloads/mednaffe-$pkgver.tar.gz)
md5sums=('56ac6c4d89638f9384920f6ea6b72e3c')

build() {
  cd "$srcdir"/mednaffe-$pkgver
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir"/mednaffe-$pkgver
  make prefix="$pkgdir"/usr install
}

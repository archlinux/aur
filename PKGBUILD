# Maintainer: Vaporeon <vaporeon@vaporeon.io>

pkgname=mednaffe-gtk2
pkgver=0.8.7
pkgrel=1
pkgdesc="front-end (GUI) for mednafen emulator (GTK2 Version)"
arch=('i686' 'x86_64')
url="https://github.com/AmatCoder/mednaffe"
license=('GPL')
depends=('mednafen' 'gtk2')
provides=('mednaffe')
conflicts=('mednaffe')
source=(https://github.com/AmatCoder/mednaffe/releases/download/$pkgver/mednaffe-$pkgver.tar.gz)
sha1sums=('a855e0fa3c794eaf6bf46990eaf9e0a9433cb1b9')

build() {
  cd "$srcdir"/mednaffe-$pkgver
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir"/mednaffe-$pkgver
  make prefix="$pkgdir"/usr install
}

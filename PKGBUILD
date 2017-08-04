# Maintainer: Vaporeon <vaporeon@vaporeon.io>

pkgname=mednaffe-gtk2
pkgver=0.8.6
pkgrel=1
pkgdesc="front-end (GUI) for mednafen emulator (GTK2 Version)"
arch=('i686' 'x86_64')
url="https://github.com/AmatCoder/mednaffe"
license=('GPL')
depends=('mednafen' 'gtk2')
provides=('mednaffe')
conflicts=('mednaffe')
source=(https://github.com/AmatCoder/mednaffe/releases/download/v$pkgver/mednaffe-$pkgver.tar.gz)
sha1sums=('088acecb5b877d5205bd08bde1a55a865823ddc2')

build() {
  cd "$srcdir"/mednaffe-$pkgver
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir"/mednaffe-$pkgver
  make prefix="$pkgdir"/usr install
}

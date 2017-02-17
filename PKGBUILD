# Maintainer: Vaporeon <vaporeon@vaporeon.io>

pkgname=mednaffe-gtk2
pkgver=0.8.5
pkgrel=1
pkgdesc="front-end (GUI) for mednafen emulator (GTK2 Version)"
arch=('i686' 'x86_64')
url="https://github.com/AmatCoder/mednaffe"
license=('GPL')
depends=('mednafen' 'gtk2')
provides=('mednaffe')
conflicts=('mednaffe')
source=(https://github.com/AmatCoder/mednaffe/releases/download/v$pkgver/mednaffe-$pkgver.tar.gz)
sha1sums=('ed5338322465e594ef040253f61fef462b33d72d')

build() {
  cd "$srcdir"/mednaffe-$pkgver
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir"/mednaffe-$pkgver
  make prefix="$pkgdir"/usr install
}

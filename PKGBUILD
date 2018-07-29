# Maintainer: Vaporeon <vaporeon@vaporeon.io>

pkgname=mednaffe-gtk2
pkgver=0.8.8
pkgrel=1
pkgdesc="front-end (GUI) for mednafen emulator (GTK2 Version)"
arch=('i686' 'x86_64')
url="https://github.com/AmatCoder/mednaffe"
license=('GPL')
depends=('mednafen' 'gtk2')
provides=('mednaffe')
conflicts=('mednaffe')
source=(https://github.com/AmatCoder/mednaffe/releases/download/$pkgver/mednaffe-$pkgver.tar.gz)
sha1sums=('f66f7bd3b015741a7632728b23af9df6124f1e3c')

build() {
  cd "$srcdir"/mednaffe-$pkgver
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir"/mednaffe-$pkgver
  make prefix="$pkgdir"/usr install
}

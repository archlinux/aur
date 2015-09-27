# Maintainer: Antonio Cardace <anto.cardace@gmail.com>
pkgname=wavetrack-git
pkgver=0.1
pkgrel=1
pkgdesc="A real-time pitch-tracking library based on wavelets."
arch=('any')
url="https://github.com/ichigo663/WaveTrack"
license=('GPL3')
depends=('glibc>=2.3')
makedepends=('git' 'make')
provides=("$pkgname=$pkgver")
conflicts=("$pkgname")
replaces=("$pkgname")
install="${pkgname}.install"
source=("$pkgname::git+https://github.com/ichigo663/WaveTrack.git")
md5sums=("SKIP")

build() {
   cd "$srcdir/$pkgname"
   make
}

package() {
   cd "$srcdir/$pkgname"
   if [ "$CARCH" == "x86_64" ]; then
      make DESTDIR="$pkgdir" install
   else
      make DESTDIR="$pkgdir" LIBPATH="lib32" install
   fi
}
